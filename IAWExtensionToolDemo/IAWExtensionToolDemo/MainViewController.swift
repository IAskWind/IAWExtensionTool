//
//  ViewController.swift
//  IAWExtensionToolDemo
//
//  Created by winston on 16/11/18.
//  Copyright © 2016年 winston. All rights reserved.
//

import UIKit
import IAWExtensionTool

class MainViewController: IAWBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.brown
        let a = UITextField()
        a.iawSetLimit(10)
        var b = [Int]()
        b.append(1)
        b.append(2)
        b.append(3)
        print(b.iawArrCommaPartition())
        print(b.iawArrCopy(count: 2))
        print(UIScreen.iawWidth)
        
        IAWProgressHUDTool.initProgressHUD()
        IAWProgressHUDTool.showErrorInfo(msg: "你好，世界")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
