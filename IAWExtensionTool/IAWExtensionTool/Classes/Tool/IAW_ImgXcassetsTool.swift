//
//  IAWXcassetsTool.swift
//  IAWExtensionTool
//
//  Created by winston on 16/11/17.
//  Copyright © 2016年 winston. All rights reserved.
//

import Foundation

public enum IAW_ImgXcassetsTool: String {
    
    case defaultInfo = "defaultInfo"
    case errorInfo = "errorInfo"
    case successInfo = "successInfo"
    case headerPhoto = "headerPhoto"
    case v2_refreshWhite = "v2_refreshWhite"
    case back_9x15 = "back_9x15"
    case not_network_loading_226x119 = "not_network_loading_226x119"
    case iaw_snow = "iaw_snow"
      
    /// Returns the associated image.
    public var image: UIImage {
        return UIImage(named: rawValue, in: Bundle.iawframeworkBundle(), compatibleWith: nil)!
    }
}
