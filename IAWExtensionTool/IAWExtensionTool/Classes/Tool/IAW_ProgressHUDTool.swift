//
//  IAWProgressHUDTool.swift
//  IAWExtensionTool
//
//  Created by winston on 16/11/16.
//  Copyright © 2016年 winston. All rights reserved.
//

import Foundation
import SVProgressHUD
open class IAW_ProgressHUDTool{
    
    //一般在BaseViewController调用
    open class func initProgressHUD(){
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
        SVProgressHUD.setMinimumDismissTimeInterval(1.0)
        SVProgressHUD.setBackgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5))
        SVProgressHUD.setForegroundColor(UIColor.white)
    }
    
    open class func showInfo(msg:String?){
        SVProgressHUD.show(IAWXcassetsTool.defaultInfo.image, status: msg)
    }
    
    open class  func showErrorInfo(msg:String?){
          SVProgressHUD.show(IAWXcassetsTool.errorInfo.image,status:msg)
    }
    
    open class  func showSuccessInfo(msg:String?){
        SVProgressHUD.show(IAWXcassetsTool.successInfo.image, status: msg)
    }
    
    open class  func show(msg:String?){
        SVProgressHUD.show(withStatus:msg)
    }
    
    open class  func dimiss(){
        if SVProgressHUD.isVisible() {
            SVProgressHUD.dismiss()
        }
    }
    
}
