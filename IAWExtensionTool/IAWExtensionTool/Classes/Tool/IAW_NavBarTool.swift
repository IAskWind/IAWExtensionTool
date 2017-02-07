//
//  IAW_NavBarTool.swift
//  IAWExtensionTool
//
//  Created by winston on 17/1/24.
//  Copyright © 2017年 winston. All rights reserved.
//

import Foundation
open class IAW_NavBarTool{
    
    /**
     ** 用在AppDelegate做全局设置
     */
    open class func setNavBarColor(barColor:UIColor) {
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = barColor
    }
}
