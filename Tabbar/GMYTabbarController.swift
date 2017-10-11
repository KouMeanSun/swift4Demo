//
//  GMYTabbarController.swift
//  Swift4Demo
//
//  Created by 高明阳(01370716) on 2017/9/27.
//  Copyright © 2017年 高明阳(01370716). All rights reserved.
//

import UIKit

class GMYTabbarController: UITabBarController,GMYTabbarDelegate {
    
    /**
     隐藏tabbar
     **/
    func hidenTabar(){
        UIView.animate(withDuration: 0.25) {
            self.myTabbar.frame = CGRect(x: 0, y:  UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: self.tabBar.bounds.size.height)
        }
    }
    /**
     展示tabbar
     **/
    func showTabbar(){
        UIView.animate(withDuration: 0.25) {
            self.myTabbar.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - self.tabBar.bounds.size.height, width: UIScreen.main.bounds.size.width, height: self.tabBar.bounds.size.height)
        }
    }
    
    private  let myTabbar = GMYTabbar();

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI();
    }

    private func initUI(){
        //1.移除系统自带的tabbar
        self.tabBar.removeFromSuperview();
        self.tabBar.isHidden = true;//为了解决上一行代码无效的bug
        //2.设置自定义tabbar的frame
        self.myTabbar.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - self.tabBar.bounds.size.height, width: UIScreen.main.bounds.size.width, height: self.tabBar.bounds.size.height)
        //3.设置代理
        self.myTabbar.delegate = self
        self.tabBarController?.tabBar.delegate = self
        //4.添加到view上
        self.view.addSubview(self.myTabbar)
        //5.添加button
        let img = UIImage(named: "icon_zx_nomal_pgall.png");
        let pre = UIImage(named: "icon_zx_pressed_pgall.png");
        self.myTabbar.addButtonWithImage(image: img!, selectedImg: pre!, title: "资讯")
        self.myTabbar.addButtonWithImage(image: UIImage(named: "icon_jx_nomal_pgall.png")!, selectedImg: UIImage(named: "icon_jx_pressed_pgall.png")!, title: "精选")
        self.myTabbar.addButtonWithImage(image: UIImage(named: "icon_sq_nomal_pgall.png")!, selectedImg: UIImage(named: "icon_sq_pressed_pgall.png")!, title: "社区")
        self.myTabbar.addButtonWithImage(image: UIImage(named: "icon_w_nomal_pgall.png")!, selectedImg: UIImage(named: "icon_w_pressed_pgall.png")!, title: "我的")
        //6.添加响应的viewcontroller
        let  news     = ZiXunViewController()
        news.title    = "资讯"
        let  newsNav  = UINavigationController(rootViewController: news)
        
        let  hero     = JingXuanViewController()
        hero.title    = "精选"
        let  heroNav  = UINavigationController(rootViewController: hero)
        
        let  info     = SheQuViewController()
        info.title    = "社区"
        let  infoNav  = UINavigationController(rootViewController: info)
        
        let  set      = MineViewController()
        set.title     = "我的"
        let  setNav   = UINavigationController(rootViewController: set)
        
        self.viewControllers = [newsNav,heroNav,infoNav,setNav]
        
    }
    

    //MARK: GMYTabbarDelegate
    func selectedGMYTabbar(tabbar: GMYTabbar, from: Int, to: Int) {
        self.selectedIndex = to
    }
}
