//
//  MYTitleLabel.swift
//  Swift4Demo
//
//  Created by 高明阳(01370716) on 2017/9/27.
//  Copyright © 2017年 高明阳(01370716). All rights reserved.
//

import UIKit

class MYTitleLabel: UILabel {
    
    var scale:CGFloat?;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.textAlignment = NSTextAlignment.center;
        self.font = UIFont.systemFont(ofSize: 18);
        self.scale = 0;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///设置缩放
    func setScale(scale:CGFloat) -> Void {
        self.scale = scale;
        self.textColor = UIColor(red: scale, green: 0.0, blue: 0.0, alpha: 1);
        let minScale = CGFloat(0.7);
        let trueScale = minScale + (1-minScale)*scale;
        UIView.animate(withDuration: 0.2, delay: 0.01, options: UIViewAnimationOptions.curveEaseIn, animations: {
           self.transform = CGAffineTransform(scaleX: trueScale, y: trueScale);
        }) { (true) in
            
        }
        
    }

}
