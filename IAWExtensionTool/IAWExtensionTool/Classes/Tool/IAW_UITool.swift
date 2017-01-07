//
//  IAW_UITool.swift
//  IAWExtensionTool
//
//  Created by winston on 17/1/6.
//  Copyright © 2017年 winston. All rights reserved.
//  ui操作 包括 toTabBar 退出登录(清除Token)
//

import Foundation
open class IAW_UITool{
    
    open class func toTabBar(_ target: UIViewController,transitionStyle:UIModalTransitionStyle){
        weak var weakSelf = target
        let tabBar = IAW_TabBarController();
        tabBar.modalTransitionStyle = transitionStyle
        weakSelf?.present(tabBar, animated: true, completion: nil)
    }
    
    open class func loginOut(_ target: UIViewController){
        weak var weakSelf = target
        UserDefaults.standard.set("", forKey: IAW_AccessToken)
        weakSelf?.dismiss(animated: true, completion: nil)
    }



}
