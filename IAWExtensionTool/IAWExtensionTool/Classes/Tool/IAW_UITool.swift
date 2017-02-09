//
//  IAW_UITool.swift
//  IAWExtensionTool
//
//  Created by winston on 17/1/6.
//  Copyright © 2017年 winston. All rights reserved.
//  ui操作 包括 toTabBar 退出登录(清除Token)
//

import Foundation
import SlideMenuControllerSwift
open class IAW_UITool{
    ///childVcArray  第一个参数chindviewcontroller，第二个参数title,第三个imageName
    open class func toTabBar(_ target: UIViewController,transitionStyle:UIModalTransitionStyle,childVcArray:[(String,String,String,Bool)]){
        weak var weakSelf = target
        let tabBar = IAW_TabBarController();
        tabBar.childVcArray = childVcArray
        tabBar.modalTransitionStyle = transitionStyle
        weakSelf?.present(tabBar, animated: true, completion: nil)
    }
    
    open class func loginOut(_ target: UIViewController){
        weak var weakSelf = target
        UserDefaults.standard.set("", forKey: IAW_AccessToken)
        weakSelf?.dismiss(animated: true, completion: nil)
    }
    // 带侧边栏 带底部tabbar
    //注意：用在AppDelegate的调用 //并且返回的UIWindow要赋值给AppDelegate声明的
    open class func toTabBarAndSlideMenu(leftVC: UIViewController,transitionStyle:UIModalTransitionStyle,childVcArray:[(String,String,String,Bool)])->UIWindow{
//        weak var weakSelf = target
        let tabBar = IAW_TabBarController(childVcArray:childVcArray)
        SlideMenuOptions.contentViewScale = 1
//                SlideMenuOptions.contentViewOpacity = 0.5 //背景通明度
        let slideMenuController = IAW_SlideMenuController(mainViewController: tabBar, leftMenuViewController: leftVC)
        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        slideMenuController.delegate = tabBar
        slideMenuController.modalTransitionStyle = transitionStyle
        return IAW_AppTool.rootVC(vc: slideMenuController)
        
    }


}
