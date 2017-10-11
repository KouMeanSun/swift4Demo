//
//  SQLiteManager.swift
//  Swift4Demo
//
//  Created by 高明阳(01370716) on 2017/10/9.
//  Copyright © 2017年 高明阳(01370716). All rights reserved.
//

import UIKit

class SQLiteManager: NSObject {
    //MARK:--创建类的静态实例变量即为单例对象，let- 是线程安全的
  private  static let instance = SQLiteManager();
    //对外提供创建单例对象的入口
    class func shareInstance() -> SQLiteManager{
        return instance;
    }
    
    //MARK:数据库操作
    
    //定义数据库变量
    var db:OpaquePointer? = nil;
    //打开数据库
//    func openDB() -> Bool {
//        //数据库文件路径
//        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last;
//        let dbPath  = (documentPath! as NSString).appendingPathComponent(DataBasePre.DATABASE_NAME);
//        print("dbPath:\(dbPath)");
//        let cDBPath = dbPath.cString(using: .utf8);
//        //打开数据库
//        if sqlite3_open(cDBPath, &db) != SQLITE_OK {
//            print("数据库打开失败！");
//            return false;
//        }
//
//        return self.createTable();
//    }
    
    //创建表
//    func createTable() -> Bool {
//        //建表sql语句
//        let createArticleTable = "CREATE TABLE IF NOT EXISTS \(DataBasePre.kArticleModelTableName) ( 'ID' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,\(DataBasePre.kArticleModelArticleTags)  TEXT,\(DataBasePre.kArticleModelDigest) TEXT,\(DataBasePre.kArticleModelDocid)  TEXT,\(DataBasePre.kArticleModelFromTopicSource)  TEXT,\(DataBasePre.kArticleModelGameName)  TEXT,\(DataBasePre.kArticleModelId)  TEXT,\(DataBasePre.kArticleModelImgsrc)  TEXT,\(DataBasePre.kArticleModelLmodify)  TEXT,\(DataBasePre.kArticleModelNewTopicId) INTEGER,\(DataBasePre.kArticleModelPhotosetId)  TEXT,\(DataBasePre.kArticleModelPhotosetImgNum)  INTEGER,\(DataBasePre.kArticleModelPriority)  INTEGER,\(DataBasePre.kArticleModelPtime)  TEXT,\(DataBasePre.kArticleModelReadSeconds)  INTEGER,\(DataBasePre.kArticleModelReplyCount)  INTEGER,\(DataBasePre.kArticleModelShowType)  INTEGER,\(DataBasePre.kArticleModelSource)  TEXT,\(DataBasePre.kArticleModelSpecialId)  TEXT,\(DataBasePre.kArticleModelSubtitle)  TEXT,\(DataBasePre.kArticleModelTitle)  TEXT,\(DataBasePre.kArticleModelTopicId)  TEXT,\(DataBasePre.kArticleModelTopicName)  TEXT,\(DataBasePre.kArticleModelUrl)  TEXT,\(DataBasePre.kArticleModelUserId)  INTEGER,\(DataBasePre.kArticleModelUserOrder)  INTEGER,\(DataBasePre.kRequestUrl)  TEXT )";
//        print("createArticleTableSQL:\(createArticleTable)");
//
//        return self.execSQL(SQL: createArticleTable);
//    }
    
    //执行sql语句
//    func execSQL(SQL:String) -> Bool {
//        //1.将sql语句转换成c语言字符串
//        let cSQL = SQL.cString(using: .utf8);
//        //错误信息
//        let errMsg:UnsafeMutablePointer<UnsafeMutablePointer<Int8>?>? = nil;
//        if sqlite3_exec(db, cSQL, nil, nil, errMsg) == SQLITE_OK {
//            
//            return true;
//        }else {
//            print("SQL 语句执行错误 ->错误信息：一般是sql语句写错了 ...\(String(describing: errMsg))");
//            return false;
//        }
//    }
//    
//    private override init() {
//        
//    }
}
