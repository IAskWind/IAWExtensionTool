//
//  IAWColor.swift
//  IAWExtensionTool
//
//  Created by winston on 16/11/17.
//  Copyright © 2016年 winston. All rights reserved.
//

import Foundation
import UIKit
public extension UIColor {
    
    /// RGBA的颜色设置
    public static func iaw_Color(_ r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    
   

}
