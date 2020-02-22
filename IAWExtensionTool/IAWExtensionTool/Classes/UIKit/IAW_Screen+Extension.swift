//
//  IAWUIScreen.swift
//  IAWExtensionTool
//
//  Created by winston on 16/11/16.
//  Copyright © 2016年 winston. All rights reserved.
//

import Foundation
import UIKit
extension UIScreen {
    
    open var iawWidth:CGFloat {
        return UIScreen.main.bounds.size.width
    }
    open var iawHeight:CGFloat {
        return UIScreen.main.bounds.size.height
    }
    open var iawIsPortrait: Bool {
        return UIDevice.current.orientation.isPortrait
    }
}
