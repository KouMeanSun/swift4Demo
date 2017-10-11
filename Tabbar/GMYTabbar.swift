//
//  GMYTabbar.swift
//  Swift4Demo
//
//  Created by 高明阳(01370716) on 2017/9/27.
//  Copyright © 2017年 高明阳(01370716). All rights reserved.
//

import UIKit

protocol  GMYTabbarDelegate:NSObjectProtocol{
    /**
     告诉调用者，从哪里跳转到哪里
     **/
    func selectedGMYTabbar(tabbar:GMYTabbar,from:Int,to:Int)
}

class GMYTabbar: UIView {
    
   let screenWidth = UIScreen.main.bounds.size.width;
    
    var delegate:GMYTabbarDelegate?;
    //存储选中状态的状态
    private  var  selectedBtn:UIButton = UIButton ()
    /**
     根据用户传过来的图片，创建button，按顺序添加图片
     **/
    func addButtonWithImage(image:UIImage,selectedImg:UIImage,title:String){
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.setImage(selectedImg, for: .selected)

        button.titleLabel?.font = UIFont.systemFont(ofSize: 12);
        button.setTitleColor(UIColor.gray, for: .normal);
        button.setTitleColor(UIColor.red, for: .selected);
        button.setTitle(title, for: .normal);
        self.addSubview(button)
        //修改文字在图片下面的位置
        button.titleEdgeInsets = UIEdgeInsets(top: 40, left: -48, bottom: 0, right: 0);
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -2, bottom: 0, right: 0);
        button.contentEdgeInsets = UIEdgeInsets(top: -10, left: screenWidth/8, bottom: 10, right: 0);
        
        //button标题的偏移量   这里没有效果
//        button.titleEdgeInsets = UIEdgeInsets(top: CGFloat(Int((button.imageView?.frame.size.height)!)+5), left: CGFloat(-Int((button.imageView?.bounds.size.width)!)), bottom: 0, right: 0);
//        //button图片的偏移量 这里没有效果
//        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: (button.titleLabel?.frame.size.width)!/2, bottom: (button.titleLabel?.frame.size.height)!+5, right: CGFloat(-Int((button.titleLabel?.frame.size.width)!/2)));
//        self.addSubview(button)
        button.addTarget(self, action: #selector(self.click(btn:)), for: .touchUpInside);
        //首先添加的button设置为选中状态
        if self.subviews.count==1 {
            self.click(btn: button);
        }
    }
    
    
    @objc private func click(btn:UIButton){
        self.selectedBtn.isSelected = false;
        
        btn.isSelected = true;
       
        //把点击的消息传给调用者
        self.delegate?.selectedGMYTabbar(tabbar: self, from: selectedBtn.tag, to: btn.tag);
        //将传进来的button赋值
        self.selectedBtn = btn;
    }
    
    //view 加载子view方法
    override func layoutSubviews() {
        //获取子view的数据
        let count = self.subviews.count;
        for i in 0..<count {
            let button = self.subviews[i];
            button.tag = i;
            //设置button的frame
            let height = self.bounds.size.height;
            let width  = self.bounds.size.width/CGFloat(count);
            let y      = CGFloat(0);
            let x      = CGFloat(i)*width;
            button.frame = CGRect(x: x, y: y, width: width, height: height);
        }
        self.backgroundColor  = UIColor.black;
    }
}
