//
//  ViewController.swift
//  Swift4Demo
//
//  Created by 高明阳(01370716) on 2017/9/27.
//  Copyright © 2017年 高明阳(01370716). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        HTTPConnection.getRequestWithBlock(urlStr: API.testURL, param: nil) { (data, error) in
            if (error != nil){
                print("error:\(error!)")
            }else{
                let str = String(data: data!, encoding: .utf8);
                print("data:\(str!)");
            }
        }
    }

}

