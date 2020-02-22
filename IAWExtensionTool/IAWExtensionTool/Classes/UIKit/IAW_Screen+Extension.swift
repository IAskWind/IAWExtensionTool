//
//  IAWUIScreen.swift
//  IAWExtensionTool
//
//  Created by winston on 16/11/16.
//  Copyright © 2016年 winston. All rights reserved.
//

import Foundation
import UIKit
public extension UIScreen {
    
    public static var iawWidth:CGFloat {
        return UIScreen.main.bounds.size.width
    }
    public static var iawHeight:CGFloat {
        return UIScreen.main.bounds.size.height
    }
    public static var iawIsPortrait: Bool {
        return UIDevice.current.orientation.isPortrait
    }
}
