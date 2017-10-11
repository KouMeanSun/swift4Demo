//
//  WebCache.swift
//  Swift4Demo
//
//  Created by 高明阳(01370716) on 2017/10/9.
//  Copyright © 2017年 高明阳(01370716). All rights reserved.
//

import Foundation
import UIKit

typealias loadImgOK = (UIImage?) -> Void;
extension UIImageView {
    
    func setImageWithUrl(url:String?,placeHolder:String,callBack:@escaping loadImgOK) -> Void {
//        print("......");
        if placeHolder != "" {
            self.image = UIImage(named: placeHolder);
        }
        
        if let  urlStr:String = url{
            //根据url判断本地沙盒是否存在该图片，存在则加载本地图片，不存在则从网络加载图片，并且存到本地沙盒中
            let path = self.getDownloadPath() + "/\(self.md5String(str: urlStr))";
            if FileManager.default.fileExists(atPath: path) {
                self.image = UIImage(contentsOfFile: path);
                callBack(self.image);
            }else {
                //从网络获取图片
                self.downloadImageFromNet(urlStr: urlStr, path: path,callBack:callBack);
            }
        }else{
            print("url地址为空！");
        }
    
    }
   
    ///从网络获取图片
    func downloadImageFromNet(urlStr:String,path:String,callBack:@escaping loadImgOK) -> Void {
        let config = URLSessionConfiguration.default;
        let session = URLSession(configuration: config);
        let url = URL(string: urlStr);
        let downLoadTask = session.downloadTask(with: url!) { (location, response, error) in
            if error != nil {
                print("图片下载失败！\(String(describing: error))");
            }else {
                try! FileManager.default.moveItem(atPath: location!.path, toPath: path);
                let queue = DispatchQueue.main;
                    queue.async {
                        self.image = UIImage(contentsOfFile: path);
                        callBack(self.image);
                }
                
            }
        }
        downLoadTask.resume();
    }
    
    
    ///MD5 格式化网络url地址
     func md5String(str:String) -> String{

        let cStr = str.cString(using: String.Encoding.utf8);
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString();
        for i in 0 ..< 16{
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }
    
    ///获取图片在沙盒的路径
     func getDownloadPath() ->String {
        var path:String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0];
        /// 图片文件夹路径名
        let DOWNLOAD_IMG_FILE_DIR = "WebCacheDir";
        path  = path.appending(DOWNLOAD_IMG_FILE_DIR);
        if !FileManager.default.fileExists(atPath: path) {
            try!  FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
        return path;
    }
    
    ///======读取框架的缓存文件夹的大小
    /**
     获取缓存大小
     **/
     func getDownloadCacheSize() ->String{

        let length = getCacheSize()
        let size:Double = Double(length)
        if (size < 1024.0){
            return "\(String(format: "%.2f", size))B"
        }else if (size>1024.0 && size < 1024.0*1024.0){
            return "\(String(format: "%.2f", size/1024))KB"

        }else if(size>1024.0*1024.0 && size < 1024.0*1024.0*1024.0){
            return "\(String(format: "%.2f", size/1024.0/1024.0))MB"

        }else {
            return "\(String(format: "%.2f", size/1024.0/1024.0/1024.0))GB"
        }
    }
    
    
    func getCacheSize() ->UInt64{
        var total:UInt64 = 0
        let fileEnumerator = FileManager.default.enumerator(atPath: self.getDownloadPath())
        for fileName in fileEnumerator! {
            let filePath = self.getDownloadPath().appendingFormat("/\(fileName)")
            let atts:NSDictionary = try! FileManager.default.attributesOfItem(atPath: filePath) as NSDictionary
            let length = atts.fileSize()
            total += length
            
        }
        return total
    }
    
    //===========清除图片缓存方法
    
    func clearCache() -> Void {
        self.clearDownLoadCache();
    }
    
    func clearDownLoadCache(){
        let fileEnumerator = FileManager.default.enumerator(atPath: self.getDownloadPath())
        for fileName in fileEnumerator! {
            let filePath  = self.getDownloadPath().appendingFormat("/\(fileName)")
            try! FileManager.default.removeItem(atPath: filePath)
        }
    }
}
