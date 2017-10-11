//
//  HTPConnection.swift
//  Swift4Demo
//
//  Created by 高明阳(01370716) on 2017/9/27.
//  Copyright © 2017年 高明阳(01370716). All rights reserved.
//

import UIKit

typealias RequestCallBack = (Data?,Error?) ->Void

@objc protocol HTTPConnectionDelegate:NSObjectProtocol {
    @objc  func finishConnection(data:Data);
    @objc  func failedConnection(error:Error);
}

class HTTPConnection: NSObject {
    var block:RequestCallBack?;
    var delegate:HTTPConnectionDelegate?
    
    ///类方法
    ///  get,delegate
    class func getRequestWithDelegate(urlStr:String,param:Dictionary<String,AnyObject>?,delegate:HTTPConnectionDelegate){
        HTTPConnection().getRequestConnectionWithDelegate(urlStr: urlStr, param: param, delegate: delegate);
    }
    
    ///  post,delegate
    class func postRequestWithDelegate(urlStr:String,param:Dictionary<String,AnyObject>?,delegate:HTTPConnectionDelegate){
        HTTPConnection().postRequestConnectionWithDelegate(urlStr: urlStr, param: param, delegate: delegate);
    }
    
    /// get,block
    class func getRequestWithBlock(urlStr:String,param:Dictionary<String,AnyObject>?,block:@escaping RequestCallBack){
        HTTPConnection().getRequestConnectionWithBlock(urlStr: urlStr, param: param, block: block);
    }
    
    /// post,delegate
    class func postRequestWithBlock(urlStr:String,param:Dictionary<String,AnyObject>?,block:@escaping RequestCallBack){
        HTTPConnection().postRequestConnectionWithBlock(urlStr: urlStr, param: param, block: block);
    }
    
    
    ///对象方法
    ///  get,delegate
    func getRequestConnectionWithDelegate(urlStr:String,param:Dictionary<String,AnyObject>?,delegate:HTTPConnectionDelegate) -> Void {
        self.delegate = delegate;
        var myUrlStr:String?;
        if param != nil {
            let list = NSMutableArray();
            for (key ,value) in param! {
                let tmp:String = "\(key)=\(value)";
                list.add(tmp);
            }
            let paramStr = list.componentsJoined(by: "&");
            myUrlStr = urlStr.appendingFormat("?%@", paramStr);
        }else {
            myUrlStr = urlStr;
        }
        print("url:\(myUrlStr!)")
        let url = URL(string: myUrlStr!);
        let request = URLRequest(url: url!);
        
        let config  = URLSessionConfiguration.default;
        let session = URLSession(configuration: config);
        
        let task    = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                let canDo  = self.delegate?.responds(to: #selector(HTTPConnectionDelegate.finishConnection(data:)));
                if canDo! {
                    self.delegate!.finishConnection(data: data!);
                }
            }else {
                
                let canDo = self.delegate?.responds(to: #selector(HTTPConnectionDelegate.failedConnection(error:)));
                if canDo! {
                    self.delegate!.failedConnection(error: error!);
                }
            }
        }
        task.resume();
    }
    
    ///  post,delegate
    func postRequestConnectionWithDelegate(urlStr:String,param:Dictionary<String,AnyObject>?,delegate:HTTPConnectionDelegate) -> Void{
        self.delegate = delegate;
        
        print("url:\(urlStr)")
        let url = URL(string: urlStr);
        var request = URLRequest(url: url!);
        request.httpMethod  = "POST";
        
        if param != nil {
            let list = NSMutableArray();
            for (key ,value) in param! {
                let tmp:String = "\(key)=\(value)";
                list.add(tmp);
            }
            let paramStr = list.componentsJoined(by: "&");
            let paramData = paramStr.data(using: .utf8);
            request.httpBody = paramData;
        }
        
        let config  = URLSessionConfiguration.default;
        let session = URLSession(configuration: config);
        
        let task    = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                let canDo  = self.delegate?.responds(to: #selector(HTTPConnectionDelegate.finishConnection(data:)));
                if canDo! {
                    self.delegate!.finishConnection(data: data!);
                }
            }else {
                
                let canDo = self.delegate?.responds(to: #selector(HTTPConnectionDelegate.failedConnection(error:)));
                if canDo! {
                    self.delegate!.failedConnection(error: error!);
                }
            }
        }
        task.resume();
    }
    
    /// get ,block 回调
    //@noescape。简单的介绍就是如果这个闭包是在这个函数结束前内被调用，就是非逃逸的即noescape。
    //@escaping  这个闭包是在函数执行完后才被调用，调用的地方超过了这函数的范围，所以叫逃逸闭包。
    func getRequestConnectionWithBlock(urlStr:String,param:Dictionary<String,AnyObject>?,block:@escaping RequestCallBack) -> Void {
        self.block = block;
        var myUrlStr:String!
        
        if param != nil {
            let list = NSMutableArray();
            for (key ,value) in param! {
                let tmp:String = "\(key)=\(value)";
                list.add(tmp);
            }
            let paramStr = list.componentsJoined(by: "&");
            myUrlStr = urlStr.appendingFormat("?%@", paramStr);
        }else {
            myUrlStr = urlStr;
        }
        print("url:\(myUrlStr!)")
        let url = URL(string: myUrlStr!);
        let request = URLRequest(url: url!);
        
        let config  = URLSessionConfiguration.default;
        let session = URLSession(configuration: config);
        
        let task    = session.dataTask(with: request) { (data, response, error) in
            self.block?(data,error);
        }
        task.resume();
    }
    
    /// post,block
    func postRequestConnectionWithBlock(urlStr:String,param:Dictionary<String,AnyObject>?,block:@escaping RequestCallBack) -> Void {
        self.block = block;
        
        print("url:\(urlStr)")
        let url = URL(string: urlStr);
        var request = URLRequest(url: url!);
        request.httpMethod  = "POST";
        
        if param != nil {
            let list = NSMutableArray();
            for (key ,value) in param! {
                let tmp:String = "\(key)=\(value)";
                list.add(tmp);
            }
            let paramStr = list.componentsJoined(by: "&");
            let paramData = paramStr.data(using: .utf8);
            request.httpBody = paramData;
        }
        
        let config  = URLSessionConfiguration.default;
        let session = URLSession(configuration: config);
        
        let task    = session.dataTask(with: request) { (data, response, error) in
            self.block?(data,error);
        }
        task.resume();
    }
}

