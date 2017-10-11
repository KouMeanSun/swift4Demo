//
//  ZiXunBaseSubViewController.swift
//  Swift4Demo
//
//  Created by 高明阳(01370716) on 2017/9/30.
//  Copyright © 2017年 高明阳(01370716). All rights reserved.
//

import UIKit

class ZiXunBaseSubViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let kScreenWidth  = UIScreen.main.bounds.size.width
    let kScreenHeight = UIScreen.main.bounds.size.height
    
    //请求url
    private var myUrl:String?;
    
    //tableView
    let tableView = {
        () -> UITableView in
        let myTableView = UITableView();
        
        myTableView.register(ArticleCell.classForKeyedArchiver(), forCellReuseIdentifier: "ArticleCell");
        return myTableView;
    }();
    
    //数据源
     var dataList:Array<ArticleModel> = Array<ArticleModel>();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initData();
        self.initUI();
    }
    
    private func initUI(){
//        self.tableView.frame = self.view.bounds;
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        let tabbarController      = appDelegate.gmyTabbarVC;
        
        let height = self.view.bounds.size.height-tabbarController.tabBar.bounds.size.height*2;
        self.tableView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: height);
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        self.view.addSubview(self.tableView);
    }

    
     func initData(){
//        self.dataList = Array<ArticleModel>();
//        for i in 0..<100 {
//            var model = ArticleModel();
//            model.title = "标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
//            model.replyCount = 999;
//            self.dataList?.append(model);
//        }
    }
    
    //MARK:UITableViewDelegate,UITableViewDataSource
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return   130.0;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return   self.dataList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ArticleCell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as! ArticleCell;
        cell.selectionStyle = UITableViewCellSelectionStyle.none;
//        cell.titleLbl?.text = "hahahahahahahahahah";
//        cell.commonetLbl?.text = "13";
         cell.setDataWithModel(model: self.dataList[indexPath.row]);
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.dataList[indexPath.row];
        let detailVC = ZiXunDetailViewController();
        detailVC.detailUrl = model.url;
        self.navigationController?.pushViewController(detailVC, animated: true);
        self.hiddenTabbar();
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        self.showTabbar();
    }
    
    
    /**
     隐藏tabbar
     **/
    func hiddenTabbar(){
        let adel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let tabbar = adel.gmyTabbarVC
        tabbar.hidenTabar()
    }
    /**
     显示tabbar
     **/
    func showTabbar(){
        let adel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let tabbar = adel.gmyTabbarVC
        tabbar.showTabbar()
    }

}
