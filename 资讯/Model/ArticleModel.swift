//
//  ArticleModel.swift
//  Swift4Demo
//
//  Created by 高明阳(01370716) on 2017/9/30.
//  Copyright © 2017年 高明阳(01370716). All rights reserved.
//

import UIKit

class ArticleModel: NSObject {

     var requestUrl:String?;
    
     var articleTags:String?;
     var digest:String?;
     var docid:String?;
     var fromTopicSource:Bool?;
     var gameName:String?;
     var id:Int?;
     var imgsrc:String?;
     var lmodify:String?;
     var newTopicId:Int?;
     var photosetId:String?;
     var photosetImgNum:Int?;
     var priority:Int?;
     var ptime:String?;
     var readSeconds:Int?;
     var replyCount:Int?;
     var showType:Int?;
     var source:String?;
     var specialId:String?;
     var subtitle:String?;
     var title:String?;
     var topicId:String?;
     var topicName:String?;
     var url:String?;
     var userId:Int?;
     var userOrder:Bool?;
    
    override init() {
        
    }
    
     init(dict:Dictionary<String, AnyObject>) {
        super.init();
        self.articleTags = dict["articleTags"] as? String;
        self.digest      = dict["digest"] as? String;
        self.docid       = dict["docid"] as? String;
        self.fromTopicSource = dict["fromTopicSource"]  as? Bool;
        self.gameName    = dict["gameName"] as? String;
        self.id          = dict["id"] as? Int;
        let imgSrcArr    = dict["imgsrc"] as? Array<String>;
        self.imgsrc      = imgSrcArr?[0];
        self.lmodify     = dict["lmodify"]  as? String;
        self.newTopicId  = dict["newTopicId"] as? Int;
        self.photosetId  = dict["photosetId"] as? String;
        self.photosetImgNum = dict["photosetImgNum"] as? Int;
        self.priority     = dict["priority"] as? Int;
        self.ptime        = dict["ptime"] as? String;
        self.readSeconds  = dict["readSeconds"] as? Int;
        self.replyCount   = dict["replyCount"] as? Int;
        self.showType     = dict["showType"] as? Int;
        self.source       = dict["source"] as? String;
        self.specialId    = dict["specialId"] as? String;
        self.subtitle     = dict["subtitle"] as? String;
        self.title        = dict["title"] as? String;
        self.topicId      = dict["topicId"] as? String;
        self.topicName    = dict["topicName"] as? String;
        self.url          = dict["url"] as? String;
        self.userId       = dict["userId"] as? Int;
        self.userOrder    = dict["userOrder"] as? Bool;
        self.requestUrl   = dict["requestuRL"] as? String;
    }
    
    init(sqlDict:Dictionary<String,Any>) {
        super.init();
        self.articleTags = sqlDict[DataBasePre.kArticleModelArticleTags] as? String;
        self.digest      = sqlDict[DataBasePre.kArticleModelDigest] as? String;
        self.docid       = sqlDict[DataBasePre.kArticleModelDocid] as? String;
        self.fromTopicSource = sqlDict[DataBasePre.kArticleModelFromTopicSource]  as? Bool;
        self.gameName    = sqlDict[DataBasePre.kArticleModelGameName] as? String;
        self.id          = sqlDict[DataBasePre.kArticleModelId] as? Int;
        self.imgsrc      = sqlDict[DataBasePre.kArticleModelImgsrc] as? String;
    
        self.lmodify     = sqlDict[DataBasePre.kArticleModelLmodify]  as? String;
        self.newTopicId  = sqlDict[DataBasePre.kArticleModelNewTopicId] as? Int;
        self.photosetId  = sqlDict[DataBasePre.kArticleModelPhotosetId] as? String;
        self.photosetImgNum = sqlDict[DataBasePre.kArticleModelPhotosetImgNum] as? Int;
        self.priority     = sqlDict[DataBasePre.kArticleModelPriority] as? Int;
        self.ptime        = sqlDict[DataBasePre.kArticleModelPtime] as? String;
        self.readSeconds  = sqlDict[DataBasePre.kArticleModelReadSeconds] as? Int;
        self.replyCount   = sqlDict[DataBasePre.kArticleModelReplyCount] as? Int;
        self.showType     = sqlDict[DataBasePre.kArticleModelShowType] as? Int;
        self.source       = sqlDict[DataBasePre.kArticleModelSource] as? String;
        self.specialId    = sqlDict[DataBasePre.kArticleModelSpecialId] as? String;
        self.subtitle     = sqlDict[DataBasePre.kArticleModelSubtitle] as? String;
        self.title        = sqlDict[DataBasePre.kArticleModelTitle] as? String;
        self.topicId      = sqlDict[DataBasePre.kArticleModelTopicId] as? String;
        self.topicName    = sqlDict[DataBasePre.kArticleModelTopicName] as? String;
        self.url          = sqlDict[DataBasePre.kArticleModelUrl] as? String;
        self.userId       = sqlDict[DataBasePre.kArticleModelUserId] as? Int;
        self.userOrder    = sqlDict[DataBasePre.kArticleModelUserOrder] as? Bool;
        self.requestUrl   = sqlDict[DataBasePre.kRequestUrl] as? String;
    }
    
}
