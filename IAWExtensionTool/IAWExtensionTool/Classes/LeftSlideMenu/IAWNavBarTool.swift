//
//  IAWNavBarTool.swift
//  IAWExtensionTool
//
//  Created by winston on 17/2/9.
//  Copyright © 2017年 winston. All rights reserved.
//

import UIKit
open class IAWNavBarTool{
    
    open class func setNavBar(navBarColor:UIColor,navBarTitleFontSize:CGFloat = 15,navBarTitleColor:UIColor = UIColor.white){
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = navBarColor
        navBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: navBarTitleFontSize),NSForegroundColorAttributeName: navBarTitleColor]
    }

}
