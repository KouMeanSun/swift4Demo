//
//  ZiXunViewController.swift
//  Swift4Demo
//
//  Created by 高明阳(01370716) on 2017/9/27.
//  Copyright © 2017年 高明阳(01370716). All rights reserved.
//

import UIKit
import AudioToolbox

class ZiXunViewController: UIViewController ,UIScrollViewDelegate{
    
    let kScreenWidth = UIScreen.main.bounds.size.width;
    let kScreenHeight = UIScreen.main.bounds.size.height;
    
   //分栏标题小scrollview
    private let smallScrollView = UIScrollView();
    private let smallScrollBottomView = {
        () -> UIView in
        let bottom = UIView();
        bottom.backgroundColor = UIColor.red;
        return bottom;
    }();
    private let bigScrollView   = UIScrollView();
    
    //分栏标题
    private let titleNames = ["头条","网游","手游","主机","电竞","暴雪"];

    //标题宽度
    let  myTitleLblWidth:CGFloat = 70;
    
    //子视图控制器
    private var viewControllers:Array<UIViewController>?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        
        self.initUI();
        self.playNoticeMp3();
    }
    
    private func initUI(){
        self.navigationController?.isNavigationBarHidden = true;
        self.smallScrollView.frame = CGRect(x: 0, y: 30, width: kScreenWidth, height: 50);
        self.smallScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never;
        self.bigScrollView.contentInsetAdjustmentBehavior   = UIScrollViewContentInsetAdjustmentBehavior.never;
        self.smallScrollView.showsVerticalScrollIndicator = false;
        self.smallScrollView.showsHorizontalScrollIndicator = false;
        self.addTitleLbl();
        self.view.addSubview(self.smallScrollView);
        self.smallScrollBottomView.frame = CGRect(x: 0, y: self.smallScrollView.bounds.size.height-10, width: self.myTitleLblWidth, height: 2);
        self.smallScrollView.addSubview(self.smallScrollBottomView);
        ///-------
        self.bigScrollView.frame = CGRect(x: 0, y: self.smallScrollView.frame.maxY, width: kScreenWidth, height: kScreenHeight-self.smallScrollView.frame.maxY);
        let contentX:CGFloat = CGFloat(self.titleNames.count)*kScreenWidth;
        self.bigScrollView.contentSize = CGSize(width: contentX, height: 0);
        self.bigScrollView.isPagingEnabled = true;
        self.bigScrollView.isScrollEnabled = true;
        self.bigScrollView.delegate = self;
        self.view.addSubview(self.bigScrollView);
        
        let label:MYTitleLabel = self.smallScrollView.subviews.first as! MYTitleLabel;
        label.setScale(scale: 1.0);
        self.bigScrollView.showsHorizontalScrollIndicator = false;
        ///添加子视图控制器
        let vc1 = TouTiaoViewController();
        vc1.title = "头条";
        
        let vc2 = WangYouViewController();
        vc2.title = "网游";

        let vc3 = ShouYouViewController();
        vc3.title = "手游";
        
        let vc4 = ZhuJiViewController();
        vc4.title = "主机";
        
        let vc5 = DianJingViewController();
        vc5.title = "电竞";
        
        let vc6 = BaoXueViewController();
        vc6.title = "暴雪";
        
        self.viewControllers = [vc1,vc2,vc3,vc4,vc6,vc6];
        self.addChildViewController(vc1);
        vc1.view.frame = CGRect(x: 0, y: 0, width: self.bigScrollView.bounds.size.width, height: self.bigScrollView.bounds.size.height);
        self.bigScrollView.addSubview(vc1.view);
    }
    
    private func addTitleLbl(){
        for i in 0..<self.titleNames.count {
            let lblWidth = CGFloat(myTitleLblWidth);
            let lblHeight = CGFloat(40);
            let lblY = CGFloat(0);
            let lblX = CGFloat(i)*lblWidth;
            
            let myTitleLbl = MYTitleLabel();
            myTitleLbl.text = self.titleNames[i];
            myTitleLbl.setScale(scale: 0.5);
            myTitleLbl.frame = CGRect(x: lblX, y: lblY, width: lblWidth, height: lblHeight);
            self.smallScrollView.addSubview(myTitleLbl);
            myTitleLbl.tag = i;
            myTitleLbl.isUserInteractionEnabled = true;
            let tap  = UITapGestureRecognizer(target: self, action: #selector(self.lblClick(tap:)));
            myTitleLbl.addGestureRecognizer(tap);
        }
        
        self.smallScrollView.contentSize = CGSize(width: 70*self.titleNames.count, height: 0);
    }
    
    @objc private func lblClick(tap:UITapGestureRecognizer){
        let lbl = tap.view as! MYTitleLabel;
        lbl.setScale(scale: 1.0);
        
        let offsetX = CGFloat(lbl.tag)*self.bigScrollView.frame.size.width;
        let offsetY = self.bigScrollView.contentOffset.y;
        let offset = CGPoint(x: offsetX, y: offsetY);
        self.bigScrollView.setContentOffset(offset, animated: false);
        
        //滚动标题栏
        self.updateTitleView(index: lbl.tag);
        //对子vc的处理.....
        self.updateSubVC(index: lbl.tag);
    }
    
    private func playNoticeMp3(){
        let path:String! = Bundle.main.path(forResource: "garen", ofType: "mp3")
        if  path != nil {
            let url = NSURL(fileURLWithPath: path)
            var id:SystemSoundID = 0
            AudioServicesCreateSystemSoundID(url, &id)
            AudioServicesPlayAlertSound(id)
        }
    }

    // MARK: ,UIScrollViewDelegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offX = scrollView.contentOffset.x;
        let width = self.bigScrollView.frame.size.width;
        let index = offX/width;
        //滚动标题栏
        self.updateTitleView(index: Int(index));
        //添加控制器
        self.updateSubVC(index: Int(index));
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offX = scrollView.contentOffset.x;
        self.smallScrollBottomView.frame.origin.x = offX*self.myTitleLblWidth/kScreenWidth;
        
    }
    
    
    private func updateTitleView(index:Int){
        let label:MYTitleLabel = self.smallScrollView.subviews[index] as! MYTitleLabel;
        label.setScale(scale: 1.0);
        var offsetX2 = label.center.x - self.smallScrollView.contentSize.width*0.5;
        let offsetMax = self.smallScrollView.contentSize.width - self.smallScrollView.frame.width
        if offsetX2 < 0 {
            offsetX2 = 0;
        }else if offsetX2 > offsetMax {
            offsetX2  = offsetMax;
        }
        let offset2 = CGPoint(x: offsetX2, y: self.smallScrollView.contentOffset.y);
        self.smallScrollView.setContentOffset(offset2, animated: false);
        for i in 0..<self.smallScrollView.subviews.count-1 {
            if i != index {
                let title:MYTitleLabel = self.smallScrollView.subviews[i] as! MYTitleLabel;
                title.setScale(scale: 0.5);
            }
        }
        //更新下面的游标
        UIView.animate(withDuration: 0.2, delay: 0.01, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.smallScrollBottomView.frame.origin.x = CGFloat(index*Int(self.myTitleLblWidth));
        }) { (true) in
            
        }
//        self.smallScrollBottomView.frame.origin.x = CGFloat(index*Int(self.myTitleLblWidth));
    }
    
    private func updateSubVC(index:Int){
        let vc:UIViewController = self.viewControllers![index];
        if  vc.view.superview != nil {
            return;
        }
        self.addChildViewController(vc);
        vc.view.frame = CGRect(x: index*Int(self.bigScrollView.bounds.size.width), y: 0, width: Int(self.bigScrollView.bounds.size.width), height: Int(self.bigScrollView.bounds.size.height));
        self.bigScrollView.addSubview(vc.view);
    }
    
}
