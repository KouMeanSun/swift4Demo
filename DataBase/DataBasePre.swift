//
//  DataBasePre.swift
//  Swift4Demo
//
//  Created by 高明阳(01370716) on 2017/10/9.
//  Copyright © 2017年 高明阳(01370716). All rights reserved.
//

import UIKit

class DataBasePre: NSObject {
    //数据库名
   static let DATABASE_NAME = "swiftappDB.sqlite";
    
    //ArticleModel 表配置信息
    
    //表名
    static let kArticleModelTableName = "ArticleModel";
    
    //请求来源
    static let kRequestUrl            = "requestUrl";
    
    //字段
    static let kArticleModelArticleTags = "articleTags";
    static let kArticleModelDigest = "digest";
    static let kArticleModelDocid = "docid";
    static let kArticleModelFromTopicSource = "fromTopicSource";
    static let kArticleModelGameName = "gameName";
    static let kArticleModelId = "kid";
    static let kArticleModelImgsrc = "imgsrc";
    static let kArticleModelLmodify = "lmodify";
    static let kArticleModelNewTopicId = "newTopicId";
    static let kArticleModelPhotosetId = "photosetId";
    static let kArticleModelPhotosetImgNum = "photosetImgNum";
    static let kArticleModelPriority = "priority";
    static let kArticleModelPtime = "ptime";
    static let kArticleModelReadSeconds = "readSeconds";
    static let kArticleModelReplyCount = "replyCount";
    static let kArticleModelShowType = "showType";
    static let kArticleModelSource = "source";
    static let kArticleModelSpecialId = "specialId";
    static let kArticleModelSubtitle = "subtitle";
    static let kArticleModelTitle = "title";
    static let kArticleModelTopicId = "topicId";
    static let kArticleModelTopicName = "topicName";
    static let kArticleModelUrl = "url";
    static let kArticleModelUserId = "userId";
    static let kArticleModelUserOrder = "userOrder";
    
    
    
    
    
    /**
     获取数据库路径
     **/
    class func getDataBasePath() ->String{
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let dbPath  = (path as NSString).appendingPathComponent(DataBasePre.DATABASE_NAME);
        print("数据库路径为:\(dbPath)")
        return path
    }
}
