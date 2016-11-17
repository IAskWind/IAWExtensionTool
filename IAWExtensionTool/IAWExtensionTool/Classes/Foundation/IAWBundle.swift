//
//  IAWBundle.swift
//  IAWExtensionTool
//
//  Created by winston on 16/11/17.
//  Copyright © 2016年 winston. All rights reserved.
//

import Foundation
public extension Bundle{
    
    class func iawframeworkBundle()->Bundle{
        let bundle = Bundle(for: IAWProgressHUDTool.self)
        if let path = bundle.path(forResource:"IAWExtensionTool", ofType: "bundle") {
            return Bundle(path: path)!
        }
        else {
            return bundle
        }
    
    }
}
