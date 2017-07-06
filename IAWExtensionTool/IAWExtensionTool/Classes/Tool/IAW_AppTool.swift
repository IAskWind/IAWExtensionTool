//
//  IAWAppTool.swift
//  IAWExtensionTool
//
//  Created by winston on 16/11/16.
//  Copyright © 2016年 winston. All rights reserved.
//

import Foundation
open class IAW_AppTool{
    
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
    
    open class func rootVC(mWindow:UIWindow,vc:UIViewController){
//        let window = UIWindow(frame: UIScreen.main.bounds)
        mWindow.makeKeyAndVisible()
        mWindow.rootViewController = vc
    }
    
    open class func getVersionName() -> String{
        let infoDictionary = Bundle.main.infoDictionary
        let versionName  = infoDictionary?["CFBundleShortVersionString"]as? String ?? ""//主程序版本号 versionName
        return versionName
    }
    
    open class func getVersionCode() -> Int{
        let infoDictionary = Bundle.main.infoDictionary
        let versionCode  = infoDictionary?["CFBundleVersion"]as? Int ?? 0//主程序版本号 versionCode
        return versionCode
    }
}
