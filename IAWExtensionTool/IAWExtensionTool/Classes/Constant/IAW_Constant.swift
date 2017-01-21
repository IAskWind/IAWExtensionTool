//
//  IAWConstant.swift
//  CtkApp
//
//  Created by winston on 16/12/9.
//  Copyright © 2016年 winston. All rights reserved.
//

import UIKit

/// 第一次启动
public let IAW_FirstLaunch = "firstLaunch"
/// 是否登录open
public let IAW_IsLogin = "isLogin"

public let IAW_AccessToken = "accessToken"

public let IAW_NavigationH: CGFloat = 64

/// 间距
public let IAW_KMargin: CGFloat = 10.0
/// 圆角
// UITextField 高度
public let IAW_TextFieldH: CGFloat = 55
//左边距
public let IAW_LeftMargin: CGFloat = 10

// 屏幕的宽
public let IAW_ScreenW = UIScreen.main.bounds.size.width
// 屏幕的高
public let IAW_ScreenH = UIScreen.main.bounds.size.height

///公用线条
//public  var IAW_CommonLine:UIView = {
//    let line = UIView()
//    line.alpha = 0.2
//    line.backgroundColor = UIColor.gray
//    return line
//}()
//公用线条
public func IAW_CommonLine(lineColor:UIColor = UIColor.gray)-> UIView{
    let line = UIView()
    line.alpha = 0.2
    line.backgroundColor = lineColor
    return line
}
//全局NavBar的颜色
public var IAW_GlobalNavBarColor:UIColor {
    return IAW_GlobalRedColor
}

/// 背景灰色
public var IAW_GlobalBgColor: UIColor {
    return UIColor.iaw_Color(240, g: 240, b: 240, a: 1)
}

/// 红色
public var IAW_GlobalRedColor:UIColor {
    return UIColor.iaw_Color(245, g: 80, b: 83, a: 1.0)
}
/// 蓝色
public var IAW_GlobalBlueColor:UIColor {
    return UIColor.iaw_Color(84, g: 142, b: 252, a: 1.0)
    
}



