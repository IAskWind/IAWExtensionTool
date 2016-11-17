//
//  IAWAppTool.swift
//  IAWExtensionTool
//
//  Created by winston on 16/11/16.
//  Copyright © 2016年 winston. All rights reserved.
//

import Foundation
open class IAWAppTool{
    
    /**
     *注意：用在AppDelegate的rootVC //并且返回的UIWindow要赋值给AppDelegate声明的
     *
     */
    open class func rootVC(vc:UIViewController) -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.rootViewController = vc
        return window
    }
}
