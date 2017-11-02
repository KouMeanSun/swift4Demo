//
//  ArticleCell.swift
//  Swift4Demo
//
//  Created by 高明阳(01370716) on 2017/9/30.
//  Copyright © 2017年 高明阳(01370716). All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    private let screenWidth = UIScreen.main.bounds.size.width;
    private let screenHeight = UIScreen.main.bounds.size.height;

    var img:UIImageView?;
    var titleLbl:UILabel?;
    var commonetIcon:UIImageView?;
    var commonetLbl:UILabel?;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        // 360 ,270
        self.img = UIImageView();
        let imgWidth = screenWidth/3;
        let imgHeight   = imgWidth*270/360;
        self.img?.frame = CGRect(x: 15, y: 10, width: imgWidth, height: imgHeight);
//        self.img?.image = UIImage(named: "test.png");
        self.img?.layer.cornerRadius = 5;
        self.img?.layer.masksToBounds = true;
        self.contentView.addSubview(self.img!);
        
        self.titleLbl = UILabel();
        self.titleLbl?.numberOfLines = 0;
        self.titleLbl?.textAlignment = NSTextAlignment.left;
//        self.titleLbl?.backgroundColor  = UIColor.red;
        
        self.commonetIcon = UIImageView(frame: CGRect(x: (self.img?.frame.maxX)!+10, y: (self.img?.frame.maxY)!-20, width: 20, height: 15));
        self.commonetIcon?.image = UIImage(named: "common_chat_new.png");
        self.contentView.addSubview(self.commonetIcon!);
        
        self.commonetLbl  = UILabel(frame: CGRect(x: (self.commonetIcon?.frame.maxX)!+5, y: (self.commonetIcon?.frame.origin.y)!-5, width: 40, height: 20));
        
        self.contentView.addSubview(self.commonetLbl!);
    }
    
    
    public func setDataWithModel(model:ArticleModel) {
        
        
       // self.titleLbl = UILabel(frame: CGRect(x: (self.img?.frame.maxX)!+10, y: 10, width: screenWidth-(self.img?.frame.maxX)!-25, height: (self.img?.frame.size.height)!/2));
        
        let x    = (self.img?.frame.maxX)!+10;
        let y    = 10;
        let width = screenWidth-(self.img?.frame.maxX)!-25;
        let maxHeight = (self.img?.frame.size.height)!/2+10;
        //let font = UIFont.systemFont(ofSize: 16);
//        var height:CGFloat = Tool.getHeightWithWidth(width: screenWidth-(self.img?.frame.maxX)!-25, text: model.title!, font: font);
//        if height > maxHeight {
//            height = maxHeight;
//        }
//        print("height:\(height)");
//        print("maxHeight:\(maxHeight)");
        self.titleLbl?.frame = CGRect(x: x, y: CGFloat(y), width: width, height: maxHeight);
        
        self.titleLbl?.text  = model.title;
        self.contentView.addSubview(self.titleLbl!);
        
        
        self.commonetLbl?.text = String(format: "%d", model.replyCount!);
        
//        print("imgsrc:\(model.imgsrc)");
//        self.img?.setImageWithUrl(url: model.imgsrc, placeHolder: "test.png", callBack: { (image) in
////            print("callback-image:\(image!)");
//        });
        
        self.img?.sd_setImage(with: URL(string: model.imgsrc!), placeholderImage: UIImage(named: "test.png"), completed: { (image, error, cacheType, fileUrl) in
            
        });
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
