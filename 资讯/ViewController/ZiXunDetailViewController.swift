//
//  ZiXunDetailViewController.swift
//  Swift4Demo
//
//  Created by 高明阳(01370716) on 2017/10/9.
//  Copyright © 2017年 高明阳(01370716). All rights reserved.
//

import UIKit
import WebKit

class ZiXunDetailViewController: UIViewController ,WKNavigationDelegate{
    
    var detailUrl:String?;

    let kScreenWidth  = UIScreen.main.bounds.size.width
    let kScreenHeight = UIScreen.main.bounds.size.height
    
    var webView:WKWebView?;
    
    var progressView:UIProgressView?;
    
    var titleLabel:UILabel?;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI();
    }

    func initUI() -> Void {
        self.createNAV();
        self.createWebView();
    }
    
    private func createNAV(){
        //背景图片
        let navBgImageView = UIImageView(frame: CGRect(x: 0, y: 30, width: kScreenWidth, height: 44));
        navBgImageView.image = UIImage(named: "nav_bar_bg_for_seven");
        navBgImageView.isUserInteractionEnabled = true;
        self.view.addSubview(navBgImageView);
        
        //标题
        self.titleLabel  = UILabel(frame: CGRect(x: 100, y: 5, width: kScreenWidth-200, height: 34))
        self.titleLabel?.text = "新闻详情";
        self.titleLabel?.textColor = UIColor.white;
        self.titleLabel?.textAlignment = NSTextAlignment.center;
        navBgImageView.addSubview(titleLabel!);
        
        //返回按钮
        let backBtn = UIButton(type: .custom);
        backBtn.frame  = CGRect(x: 10, y: 7, width: 60, height: 30);
        let img  = UIImage(named: "nav_btn_back_normal");
        backBtn.setBackgroundImage(img, for: .normal);
        backBtn.addTarget(self, action: #selector(self.backClick), for: .touchUpInside);
        navBgImageView.addSubview(backBtn);
        
        self.progressView = UIProgressView(frame: CGRect(x: 0, y: 74, width: kScreenWidth, height: 2));
        self.progressView?.backgroundColor = UIColor.red;
        self.view.addSubview(self.progressView!);
        
    }
    
    private func createWebView(){
        
        
        let config = WKWebViewConfiguration();
        config.preferences = WKPreferences();
        config.preferences.minimumFontSize = 10;
        config.preferences.javaScriptEnabled = true;
        config.preferences.javaScriptCanOpenWindowsAutomatically = false;
//        config.processPool = WKProcessPool();
//        config.userContentController = WKUserContentController();
        
        
        self.webView = WKWebView(frame: CGRect(x: 0, y: 76, width: self.view.bounds.size.width, height: self.view.bounds.size.height-76), configuration: config);
        
        self.webView?.load(URLRequest(url: URL(string: self.detailUrl!)!));
//        self.webView?.uiDelegate = self;
        self.webView?.navigationDelegate = self;
        self.view.addSubview(self.webView!);
        
        //kvo
        self.webView?.addObserver(self, forKeyPath: "title", options: .new, context: nil);
        self.webView?.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil);
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (object as? WKWebView) != nil {
            if (keyPath == "title"){
                if let newValue =  change?[NSKeyValueChangeKey.newKey] {
                    self.titleLabel?.text = newValue as? String;
                }else {
                    
                }
            }
            
            if (keyPath == "estimatedProgress"){
                if (change?[NSKeyValueChangeKey.newKey]) != nil {
                    self.progressView?.progress = Float((self.webView?.estimatedProgress)!);
                }else {
                    
                }
            }
        }else {
            
        }
    }
    
    ///返回
    @objc private func backClick(){
        self.navigationController?.popViewController(animated: true);
    }
    
    //修改状态栏字体颜色
     func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent;
    }
    
    //MARK: WKNavigationDelegate
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        NSLog("页面加载完毕！");
        //去除上面的打开app提示div
        let jsString = "var topArr = document.getElementsByClassName(\"m-fixedTop\");for (var i= 0;i<topArr.length;i++) {var topNode = topArr[i];topNode.parentNode.removeChild(topNode);}";
        self.webView?.evaluateJavaScript(jsString, completionHandler: { (anyObject, error) in
            print("js执行完毕！");
        })
        //去除下面的打开app提示div  fixedBot fixedBotShow
        let jsString2 = "var topArr = document.getElementsByClassName(\"m-fixedBot\");for (var i= 0;i<topArr.length;i++) {var topNode = topArr[i];topNode.parentNode.removeChild(topNode);}";
        self.webView?.evaluateJavaScript(jsString2, completionHandler: { (anyObject, error) in
            print("js执行完毕！");
        })
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        //print("界面开始加载时调用...");
    }
    
}
