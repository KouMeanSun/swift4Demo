//
//  TouTiaoViewController.swift
//  Swift4Demo
//
//  Created by 高明阳(01370716) on 2017/9/27.
//  Copyright © 2017年 高明阳(01370716). All rights reserved.
//

import UIKit

class TouTiaoViewController: ZiXunBaseSubViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func initData() {
        
        //进行网络请求之前，先读取本地sqlite数据库的缓存数据
//        super.dataList.removeAll();
//        super.dataList += ArticleModelDB.getInstance().queryDBData(requestUrl: API.TouTiaoUrl);
        
        
        
        HTTPConnection.getRequestWithBlock(urlStr: API.TouTiaoUrl, param: nil) { (data, error) in
            if error != nil {
                print("获取数据失败:\(String(describing: error))")
                return ;
            }
            //获取数据成功：
          if  let jsonData:Dictionary<String,AnyObject> = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! Dictionary<String,AnyObject> {
                let resultData:Array<Dictionary<String,AnyObject>> = jsonData["info"] as! Array<Dictionary<String,AnyObject>>;
            
                for dict in resultData {
                let model = ArticleModel(dict: dict);
                    model.requestUrl = API.TouTiaoUrl;
                super.dataList.append(model);
                }
                //刷新UID
                let queue = DispatchQueue.main;
                queue.async {
                super.tableView.reloadData();
                    //先清除旧的数据
                   // _   =   ArticleModelDB.getInstance().removeArticleModelWithRequestUrl(requestUrl: API.TouTiaoUrl);
                    //再添加新的数据
                    //_   = ArticleModelDB.getInstance().insertIntoDBWithArray(array: super.dataList);
                }
              }else {
                print("网络数据解析失败！");
            }
            
        }
        
        
        
//        for _ in 0..<100 {
//            let model = ArticleModel();
//            model.title = "标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
//            model.replyCount = 999;
//            self.dataList.append(model);
//        }
    }
    
}
