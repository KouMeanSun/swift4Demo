//
//  AppDelegate.swift
//  Swift4Demo
//
//  Created by 高明阳(01370716) on 2017/9/27.
//  Copyright © 2017年 高明阳(01370716). All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
  public  let gmyTabbarVC = {
        () ->  GMYTabbarController in
        let tmp = GMYTabbarController();
        
        return tmp;
    }();

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.initRootViewController();
        self.initDB();
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: 设置跟视图控制器
    func initRootViewController() -> Void {
        self.window = UIWindow(frame: UIScreen.main.bounds);
        self.window?.backgroundColor = UIColor.white;
        self.window?.makeKeyAndVisible();
        
//        let first    = ZiXunViewController();
//        first.title  = "资讯";
//
//        let second   = JingXuanViewController();
//        second.title = "精选";
//        let third    = SheQuViewController();
//        third.title  = "社区";
//        let fourth   = MineViewController();
//        fourth.title = "我的";
//
//        let oneNav   = UINavigationController(rootViewController: first);
//        let twoNav   = UINavigationController(rootViewController: second);
//        let threeNav = UINavigationController(rootViewController: third);
//        let fourNav  = UINavigationController(rootViewController: fourth);
//
//        let tabVC    = MyTabBarViewController();
//
//        tabVC.addChildViewController(oneNav);
//        tabVC.addChildViewController(twoNav);
//        tabVC.addChildViewController(threeNav);
//        tabVC.addChildViewController(fourNav);
//
//        self.window?.rootViewController = tabVC;
        
        self.window?.rootViewController = self.gmyTabbarVC;
    }
    
    func initDB() -> Void {
//        if SQLiteManager.shareInstance().openDB() {
//            print("开启数据库成功!");
//        }
    }
}

