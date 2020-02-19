//
//  IAWNavigationController.swift
//  CtkApp
//
//  Created by winston on 16/12/9.
//  Copyright © 2016年 winston. All rights reserved.
//
import UIKit
//import SVProgressHUD
open class IAW_NavigationController: UINavigationController {
    
//    open override class func initialize() {
//        super.initialize()
////        /// 设置导航栏标题
////        let navBar = UINavigationBar.appearance()
////        navBar.barTintColor = IAW_GlobalNavBarColor
////        navBar.tintColor = UIColor.white
////        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.systemFont(ofSize: 20)]
//    }
    
    public convenience init(navBarTintColor:UIColor,navBarTitleFontSize:CGFloat = 15,navBarTitleColor:UIColor = UIColor.white) {
        self.init(nibName: nil, bundle: nil)
                /// 设置导航栏标题
                let navBar = UINavigationBar.appearance()
                navBar.barTintColor = navBarTintColor
                navBar.tintColor = navBarTitleColor
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: navBarTitleFontSize)]
    }
    /**
     # 统一所有控制器导航栏左上角的返回按钮
     # 让所有push进来的控制器，它的导航栏左上角的内容都一样
     # 能拦截所有的push操作
     - parameter viewController: 需要压栈的控制器
     - parameter animated:       是否动画
     */
    override open func pushViewController(_ viewController: UIViewController, animated: Bool) {
        /// 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        if viewControllers.count > 0 {
            // push 后隐藏 tabbar
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: IAW_ImgXcassetsTool.back_9x15.image, style: .plain, target: self, action: #selector(navigationBackClick))
        }
        if viewController.title != nil && !(viewController.title?.isEmpty)!{
            self.setNavigationBarHidden(false, animated: false)
        }
        super.pushViewController(viewController, animated: true)
    }
    /// 返回按钮
    @objc func navigationBackClick() {
//        if SVProgressHUD.isVisible() {
//            SVProgressHUD.dismiss()
//        }
        IAW_ProgressHUDTool.dimiss()
        if UIApplication.shared.isNetworkActivityIndicatorVisible {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        popViewController(animated: true)
    }
    
}
