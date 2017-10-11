//
//  Tool.swift
//  Swift4Demo
//
//  Created by 高明阳(01370716) on 2017/10/1.
//  Copyright © 2017年 高明阳(01370716). All rights reserved.
//

import UIKit

class Tool: NSObject {

    class func getHeightWithWidth(width:CGFloat,text:String,font:UIFont) -> CGFloat{
        let normalText:NSString = text as NSString;
        let size  = CGSize(width: width, height: 1000);
        let dict  = NSDictionary(object: font, forKey: NSAttributedStringKey.font as NSCopying );
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dict as? [NSAttributedStringKey:Any], context: nil).size;
        return stringSize.height;
    }
    
    class func getWidthWithHeight(height:CGFloat,text:String,font:UIFont) -> CGFloat {
        let normalText:NSString = text as NSString;
        let size                = CGSize(width: 1000, height: height);
        let dict                = NSDictionary(object: font, forKey: NSAttributedStringKey.font as NSCopying);
        let stringSize          = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dict as? [NSAttributedStringKey:Any], context: nil).size;
        return stringSize.width;
    }
    
}
