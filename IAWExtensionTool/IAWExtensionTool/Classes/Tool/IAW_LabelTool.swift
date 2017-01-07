//
//  IAW_LabelTool.swift
//  IAWExtensionTool
//
//  Created by winston on 17/1/6.
//  Copyright © 2017年 winston. All rights reserved.
//

import Foundation
open class IAW_LabelTool{
    
     open static var labelHeight = CGFloat(40)
    
    //设置顶部标题label
    open class func setUpLabel(_ title: String) -> UILabel {
        let styleLabel = UILabel()
        styleLabel.text = title
        styleLabel.textColor =  UIColor.iaw_Color(0, g: 0, b: 0, a: 0.6)
        styleLabel.font = UIFont.systemFont(ofSize: 16)
        
        return styleLabel
        
    }

}
