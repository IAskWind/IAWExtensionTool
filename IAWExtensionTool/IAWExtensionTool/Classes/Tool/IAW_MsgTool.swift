//
//  IAW_MsgTool.swift
//  IAWExtensionTool
//
//  Created by winston on 17/3/24.
//  Copyright © 2017年 winston. All rights reserved.
//

import Foundation
import SwiftMessages
open class IAW_MsgTool{

    open class func showMsg(msg:String,icon:Theme,seconds:TimeInterval = 1){
        getMessagesView(msg: msg,seconds:seconds) { (view) in
            view.configureTheme(icon,iconStyle:IconStyle.light)
        }
    }
    open class func showMsg(msg:String,icon:Theme,bgColor:UIColor,seconds:TimeInterval = 1){
        getMessagesView(msg: msg,seconds:seconds) { (view) in
            view.configureTheme(backgroundColor: bgColor, foregroundColor: UIColor.white, iconImage: IconStyle.light.image(theme: icon), iconText: nil)
        }
    }
    
    private class func getMessagesView(msg:String,seconds:TimeInterval = 1,blockTheme:(MessageView)->()){
        let view:MessageView = try! SwiftMessages.viewFromNib()
        view.button?.isHidden = true
        view.titleLabel?.isHidden = true
        var config = SwiftMessages.defaultConfig
        config.duration = .seconds(seconds:seconds)
        config.presentationContext = .window(windowLevel: UIWindowLevelNormal)
        view.configureContent(body: msg)
        blockTheme(view) //设置view
        //处理icon的尺寸
        view.configureIcon(withSize: CGSize(width: 22, height: 22), contentMode: .scaleAspectFill)
        SwiftMessages.show(config: config, view: view)
    }
}
