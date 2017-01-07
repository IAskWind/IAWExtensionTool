//
//  IAW_TokenTool.swift
//  IAWExtensionTool
//
//  Created by winston on 17/1/6.
//  Copyright © 2017年 winston. All rights reserved.
//

import Foundation
open class IAW_TokenTool{
    //token统一处理， 失效跳到登录
    open class func tokenDeal(tokenInvalid:Bool?) -> Bool{
        guard  tokenInvalid == false else {
            let rootVC = UIApplication.shared.keyWindow?.rootViewController
            if rootVC != nil {
                IAW_UITool.loginOut(rootVC!)
                return true
            }else{
                return false
            }
        }
        return false
    }


}
