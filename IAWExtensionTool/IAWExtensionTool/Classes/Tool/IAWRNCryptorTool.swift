//
//  IAWRNCryptorTool.swift
//  IAWExtensionTool
//  https://github.com/RNCryptor/RNCryptor
//  Created by winston on 16/11/16.
//  Copyright © 2016年 winston. All rights reserved.
//

import Foundation
import RNCryptor
open class IAWRNCryptorTool{

    //加密
    open class func Encrypt(data:String,key:String)->String{
        let strEncrypt = RNCryptor.encrypt(data: data.data(using: .utf8)!, withPassword: key).base64EncodedString()
        return strEncrypt
    }
    //解密
    open class func Decrypt(data:String,key:String)throws ->String{
        let decodedData = NSData(base64Encoded:data, options: NSData.Base64DecodingOptions(rawValue: 0))
        let decryptData = try RNCryptor.decrypt(data: decodedData as! Data, withPassword: key)
        let strDecrypt = NSString(data: decryptData, encoding: String.Encoding.utf8.rawValue) as! String
        return strDecrypt
    }

}
