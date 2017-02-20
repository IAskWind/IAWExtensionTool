//
//  IAWTabBarController.swift
//  CtkApp
//
//  Created by winston on 16/12/9.
//  Copyright © 2016年 winston. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
open class IAW_TabBarController: UITabBarController {
    //第一个参数chindviewcontroller，第二个参数title,第三个imageName,第4个是否有侧边栏
    var childVcArray:[(String,String,String,Bool)]?
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = UIColor(red: 245 / 255, green: 80 / 255, blue: 83 / 255, alpha: 1.0)
        
    }
    public convenience init(childVcArray: [(String,String,String,Bool)]) {
        self.init(nibName: nil, bundle: nil)
        self.childVcArray = childVcArray
        self.addChildViewControllers()
    }
    
    /**
     # 添加子控制器
     */
    public func addChildViewControllers() {
        for childVc in childVcArray! {
            addChildViewController(childControllerName: childVc.0, title: childVc.1, imageName: childVc.2,isLeftBarBtn:childVc.3)
        
        }
        
        
//        addChildViewController(childControllerName: String(describing: IAWMainAllViewController.self), title: CtkTabBarItem.Main.rawValue, imageName: "TabBar_home_23x23_")
//        addChildViewController(childControllerName: String(describing: IAWUploadViewController.self), title: CtkTabBarItem.Upload.rawValue, imageName: "camera_23x23_")
//        addChildViewController(childControllerName: String(describing: IAWMeViewController.self), title: CtkTabBarItem.Me.rawValue, imageName: "TabBar_me_boy_23x23_")
        
    }
    /**
     # 初始化子控制器
     
     - parameter childControllerName: 需要初始化的控制器
     - parameter title:               标题
     - parameter imageName:           图片名称
     */
    private func addChildViewController(childControllerName: String, title: String, imageName: String,isLeftBarBtn:Bool) {
        // 动态获取命名空间
        let ns = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        // 将字符串转化为类，默认情况下命名空间就是项目名称，但是命名空间可以修改
        let cls: AnyClass? = NSClassFromString(ns + "." + childControllerName)
        let vcClass = cls as! UIViewController.Type
        let vc = vcClass.init()
        // 设置对应的数据
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "selected")
        vc.title = title
        // 给每个控制器包装一个导航控制器
        let nav = IAW_NavigationController()
        if isLeftBarBtn {
            IAW_SlideMenuTool.addLeftBarItem(target: vc)
        }

        nav.addChildViewController(vc)
        addChildViewController(nav)
    }
    
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        if item.title! == CtkTabBarItem.Upload.rawValue{
//            if let upload = self.childViewControllers[1].childViewControllers[0] as? IAWUploadViewController{
//                upload.loadTips()
//            }
//        }
//       
//       
//    }
    
    
}

extension IAW_TabBarController : SlideMenuControllerDelegate {
    
    public func leftWillOpen() {
        print("SlideMenuControllerDelegate: leftWillOpen")
        
    }
    
    public func leftDidOpen() {
        print("SlideMenuControllerDelegate: leftDidOpen")
    }
    
    public func leftWillClose() {
        print("SlideMenuControllerDelegate: leftWillClose")
    }
    
    public func leftDidClose() {
        print("SlideMenuControllerDelegate: leftDidClose")
    }
    
    public func rightWillOpen() {
        print("SlideMenuControllerDelegate: rightWillOpen")
    }
    
    public func rightDidOpen() {
        print("SlideMenuControllerDelegate: rightDidOpen")
    }
    
    public func rightWillClose() {
        print("SlideMenuControllerDelegate: rightWillClose")
    }
    
    public func rightDidClose() {
        print("SlideMenuControllerDelegate: rightDidClose")
    }
}
