//
//  IAW_SlideMenuController.swift
//  IAWExtensionTool
//
//  Created by winston on 17/1/23.
//  Copyright © 2017年 winston. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
open class IAW_SlideMenuController : SlideMenuController {
    
    override open func isTagetViewController() -> Bool {
        //        if let vc = UIApplication.topViewController() {
        //            if vc is MainViewController ||
        //            vc is SwiftViewController ||
        //            vc is JavaViewController ||
        //            vc is GoViewController {
        //                return true
        //            }
        //        }
        return false
    }
    
    /*override func track(_ trackAction: TrackAction) {
     switch trackAction {
     case .LeftTapOpen:
     print("TrackAction: left tap open.")
     case .LeftTapClose:
     print("TrackAction: left tap close.")
     case .LeftFlickOpen:
     print("TrackAction: left flick open.")
     case .LeftFlickClose:
     print("TrackAction: left flick close.")
     case .RightTapOpen:
     print("TrackAction: right tap open.")
     case .RightTapClose:
     print("TrackAction: right tap close.")
     case .RightFlickOpen:
     print("TrackAction: right flick open.")
     case .RightFlickClose:
     print("TrackAction: right flick close.")
     }
     }*/
}
