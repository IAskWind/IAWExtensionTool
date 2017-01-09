//
//  IAW_SignMd5Tool.swift
//  IAWExtensionTool
//
//  Created by winston on 16/12/27.
//  Copyright © 2016年 winston. All rights reserved.
//

import Foundation
//import CryptoSwift

open class IAW_SignMd5Tool{
    
    open class func signMd5(paras:[String:String],secret:String)->String{
        //第一步key排序
        let sortParas = paras.sorted(by: {$0.0<$1.0})
        // 第二步：把所有参数名和参数值串在一起
        var query = ""
        query = query + secret
        for(key,value) in sortParas{
            query = query + "\(key)\(value)"
        }
        query = query + secret
        // 第三步：使用MD5
        let bytes = query.utf8.map({$0})
//        let digest = Digest.md5(bytes)
//        // 第四步：把二进制转化为大写的十六进制
//        let md5Str = digest.toHexString().uppercased()
//        return md5Str
        return ""
    }
    
    
    
}
