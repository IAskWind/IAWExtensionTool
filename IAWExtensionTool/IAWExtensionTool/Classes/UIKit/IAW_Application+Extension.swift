//
//  IAWApplication.swift
//  IAWExtensionTool
//
//  Created by winston on 16/11/16.
//  Copyright © 2016年 winston. All rights reserved.
//

import Foundation
import UIKit
public extension UIApplication{
    
    //window存在的情况下，不能用在AppDelegate
    class func iawRootVC(vc:UIViewController) {
        UIApplication.shared.keyWindow?.rootViewController = vc
    }

}
