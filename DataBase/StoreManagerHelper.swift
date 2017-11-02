//
//  StoreManagerHelper.swift
//  Swift4Demo
//
//  Created by 高明阳(01370716) on 2017/10/11.
//  Copyright © 2017年 高明阳(01370716). All rights reserved.
//

import UIKit

class StoreManagerHelper: NSObject {
    //private   let my_FMDatabaseQueue:FMDatabaseQueue = FMDatabaseQueue(path: DataBasePre.getDataBasePath());
    //let queue:FMDatabaseQueue = FMDatabaseQueue(path: DataBasePre.getDataBasePath());
    private static let instance = StoreManagerHelper();
    class func shareInstance() ->StoreManagerHelper {
        return instance;
    }
    
//    func getSharedDatabaseQueue() ->FMDatabaseQueue{
//        return my_FMDatabaseQueue;
//    }
//    

    
    private   override init() {
//        print("StoreManagerHelper初始化了一次")
    }
    
}
