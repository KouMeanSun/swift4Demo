//
//  API.swift
//  Swift4Demo
//
//  Created by 高明阳(01370716) on 2017/9/27.
//  Copyright © 2017年 高明阳(01370716). All rights reserved.
//

import UIKit

class API: NSObject {
//    //头条
//
//    http://i.play.163.com/user/article/list///80/20
//
//    ///网游
//
//    http://i.play.163.com/user/article/list//T1461396384709/80/20
//
//    //手游
//
//    http://i.play.163.com/user/article/list//T1461396358842/80/20
//
//    //主机
//    http://i.play.163.com/user/article/list//T1461396291717/80/20
//
//    //电竞
//    http://i.play.163.com/user/article/list//T1461396413033/80/20
//
//    //暴雪
//    http://i.play.163.com/user/article/list//T1461396489605/80/20
//

    private static let HostUrl = "http://i.play.163.com";
    private static let ArticleList = HostUrl + "/user/article/list";
    
    public  static let TouTiaoUrl = ArticleList + "/80/20";
    public  static let WanYouUrl  = ArticleList + "/T1461396384709/80/20";
    public  static let ShaouYouUrl = ArticleList + "/T1461396358842/80/20";
    public  static let ZhuJiUrl   = ArticleList + "/T1461396291717/80/20";
    public  static let DianJingUrl = ArticleList + "/T1461396413033/80/20";
    public  static let BaoXurUrl    = ArticleList + "/T1461396489605/80/20";
    
    public static let testURL = "http://i.play.163.com/user/article/list///80/20";
}
