//
//  IAWXcassetsTool.swift
//  IAWExtensionTool
//
//  Created by winston on 16/11/17.
//  Copyright © 2016年 winston. All rights reserved.
//

import Foundation

public enum IAWXcassetsTool: String {
    
    case defaultInfo = "defaultInfo"
    case errorInfo = "errorInfo"
    case successInfo = "successInfo"
    case headerPhoto = "headerPhoto"
      
    /// Returns the associated image.
    public var image: UIImage {
        return UIImage(named: rawValue, in: Bundle.iawframeworkBundle(), compatibleWith: nil)!
    }
}
