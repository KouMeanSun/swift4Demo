//
//  ArticleModelDB.swift
//  Swift4Demo
//
//  Created by 高明阳(01370716) on 2017/10/9.
//  Copyright © 2017年 高明阳(01370716). All rights reserved.
//

import UIKit

class ArticleModelDB: NSObject {

    private static let instance = ArticleModelDB();
    
    class func getInstance() ->ArticleModelDB{
        return instance;
    }
    
    private override init() {
        
    }
    
    
    //插入方法
//    func insertDB(model:ArticleModel) -> Bool {
//        //插入语句
//        let insertSQL = "INSERT INTO \(DataBasePre.kArticleModelTableName)  ( \(DataBasePre.kArticleModelArticleTags),\(DataBasePre.kArticleModelDigest),\(DataBasePre.kArticleModelDocid),\(DataBasePre.kArticleModelFromTopicSource),\(DataBasePre.kArticleModelGameName),\(DataBasePre.kArticleModelId),\(DataBasePre.kArticleModelImgsrc),\(DataBasePre.kArticleModelLmodify),\(DataBasePre.kArticleModelNewTopicId),\(DataBasePre.kArticleModelPhotosetId),\(DataBasePre.kArticleModelPhotosetImgNum),\(DataBasePre.kArticleModelPriority),\(DataBasePre.kArticleModelPtime),\(DataBasePre.kArticleModelReadSeconds),\(DataBasePre.kArticleModelReplyCount),\(DataBasePre.kArticleModelShowType),\(DataBasePre.kArticleModelSource),\(DataBasePre.kArticleModelSpecialId),\(DataBasePre.kArticleModelSubtitle),\(DataBasePre.kArticleModelTitle),\(DataBasePre.kArticleModelTopicId),\(DataBasePre.kArticleModelUrl),\(DataBasePre.kArticleModelTopicName),\(DataBasePre.kArticleModelUserId),\(DataBasePre.kArticleModelUserOrder),\(DataBasePre.kRequestUrl) ) VALUES ( '\(String(describing: model.articleTags!))', '\(String(describing: model.digest!))','\(String(describing: model.docid!))',\(String(describing: model.fromTopicSource!)),'\(String(describing: model.gameName!))',\(String(describing: model.id!)),'\(String(describing: model.imgsrc!))','\(String(describing: model.lmodify!))',\(String(describing: model.newTopicId!)),'\(String(describing: model.photosetId!))',\(String(describing: model.photosetImgNum!)),\(String(describing: model.priority!)),'\(String(describing: model.ptime!))',\(String(describing: model.readSeconds!)),\(String(describing: model.replyCount!)),\(String(describing: model.showType!)),'\(String(describing: model.source!))','\(String(describing: model.specialId!))','\(String(describing: model.subtitle!))','\(String(describing: model.title!))','\(String(describing: model.topicId!))','\(String(describing: model.topicName!))','\(String(describing: model.url!))',\(String(describing: model.userId!)),'\(String(describing: model.userOrder!))','\(String(describing: model.requestUrl!))' )";
//        print("insertSql:\(insertSQL)");
////        let queue = DispatchQueue.main;
//        var flag  = false;
////        queue.sync {
//            if SQLiteManager.shareInstance().execSQL(SQL: insertSQL) {
//                print("插入数据成功！")
//                flag = true;
//            }else {
//                flag = false;
//            }
////        }
//        return flag;
//    }
//
//    func  insertIntoDBWithArray(array:Array<ArticleModel>) -> Bool {
//        var flag = true;
//        for item in array {
//          let tmp =   self.insertDB(model: item);
//            if tmp == false {
//                flag = tmp;
//            }
//        }
//        return flag;
//    }
    
    
    //查询数据库中的数据
//    func queryDBData(requestUrl:String) -> Array<ArticleModel> {
//        //定义游标条件
//        var stmt:OpaquePointer? = nil;
//        //查询语句
//        let querySQL = "SELECT * FROM \(DataBasePre.kArticleModelTableName) WHERE \(DataBasePre.kRequestUrl) = '\(requestUrl)' ";
//        print("querySQL:\(querySQL)");
//        var queryDataArrM = Array<ArticleModel>();
//        //将需要查询的SQL语句转化为c语言
//        if querySQL.lengthOfBytes(using: .utf8) > 0 {
//            let cQuerySQL = (querySQL.cString(using: .utf8))!
//            //进行查询前的准备
//
//            //let queue = DispatchQueue.main;
//
////            queue.sync {
//                /**
//                 参数1，数据库对象
//                 参数2，查询语句
//                 参数3，查询语句的长度 -1
//                 参数4，句柄（游标对象）
//                 **/
//                if sqlite3_prepare_v2(SQLiteManager.shareInstance().db, cQuerySQL, -1, &stmt, nil)  == SQLITE_OK {
//                    //准备好之后进行解析
//
//                    while sqlite3_step(stmt) == SQLITE_ROW {
//                        //1.获取解析到的列（字段个数）
//                        let columnCount = sqlite3_column_int(stmt, 26);
//                        //2.遍历某行数据
//                        var dict = Dictionary<String,Any>();
//                        for i in 0 ..< columnCount {
//                            //取出i位置列的字段名，作为字典的建key
//                            let cKey = sqlite3_column_name(stmt, i);
//                            let key:String = String(validatingUTF8: cKey!)!;
//
//                            //取出i位置存储的值，作为字典的value
//                            let cValue = sqlite3_column_text(stmt, i);
//                            let value = String(cString: cValue!);
//                            dict[key]  = value as Any;
//                        }
//                        let model:ArticleModel = ArticleModel(sqlDict: dict);
//                        queryDataArrM.append(model);
//                    }
//
//                }
////            }
//
//        }
//
//        return queryDataArrM;
//    }
//
    //---------根据条件删除数据库数据
//    func removeArticleModelWithRequestUrl(requestUrl:String) -> Bool {
//        //删除sql语句
//        let removeSQL = "DELETE FROM \(DataBasePre.kArticleModelTableName)  WHERE \(DataBasePre.kRequestUrl) = '\(requestUrl)' ";
//        print("removeSQL:\(removeSQL)");
////        let queue = DispatchQueue.main;
//        var flag  = false;
////        queue.sync {
//            if SQLiteManager.shareInstance().execSQL(SQL: removeSQL) {
//                print("删除数据成功！")
//                flag = true;
//            }else {
//                flag = false;
//            }
////        }
//        return flag;
//    }
  
    ///MD5 格式化网络url地址
//    func md5String(str:String) -> String{
//
//        let cStr = str.cString(using: String.Encoding.utf8);
//        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
//        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
//        let md5String = NSMutableString();
//        for i in 0 ..< 16{
//            md5String.appendFormat("%02x", buffer[i])
//        }
//        free(buffer)
//        return md5String as String
//    }
//
}
