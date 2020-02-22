//
//  ViewController.swift
//  IAWExtensionToolDemo
//
//  Created by winston on 16/11/18.
//  Copyright © 2016年 winston. All rights reserved.
//

import UIKit
import IAWExtensionTool
import SnapKit

class MainViewController: IAW_BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.brown
//        self.view
//        let line = UIView()
//        line.alpha = 0.2
//        line.backgroundColor = UIColor.gray
//        IAW_CommonLine
//        IAW_CommonLine()
//        view.addSubview(IAW_CommonLine)
//        IAW_CommonLine.snp.makeConstraints{
//            (make) in
//             make.top.equalTo(self.view).offset(60)
//             make.height.equalTo(10)
//             make.width.equalTo(UIScreen.iawWidth)
//        }
//        
//        let BASE_URL = "http://fpbl.easyunion.net:8080/"
//        let url = "\(BASE_URL)api/auth/login"
//        let params = ["userName": "17855111340",
//                      "passwd": "123456"]
//
//        IAW_NetTool.loginAPP(url, params: params){
//            (userVo:UserVo) in
//                print("获得的登录用户名:\(userVo.name)")
//        
//        }
//        let a = UITextField()
//        a.iawSetLimit(10)
//        var b = [Int]()
//        b.append(1)
//        b.append(2)
//        b.append(3)
//        print(b.iawArrCommaPartition())
//        print(b.iawArrCopy(count: 2))
//        print(UIScreen.iawWidth)
        
        
        
        IAW_ProgressHUDTool.initProgressHUD()
        IAW_ProgressHUDTool.showErrorInfo(msg: "你好，世界")
        IAW_FullScreenTool.showEffect(imgEffect:IAW_ImgXcassetsTool.iaw_snow.image , window: UIApplication.shared.keyWindow)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
