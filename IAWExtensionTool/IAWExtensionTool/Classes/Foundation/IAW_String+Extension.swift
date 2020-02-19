//
//  IAWString.swift
//  IAWExtensionTool
//
//  Created by winston on 16/11/16.
//  Copyright © 2016年 winston. All rights reserved.
//

import Foundation
public extension String{
    /// 判断手机号是否合法
    static func iawIsValidmobile(_ string: String) -> Bool {
        // 判断是否是手机号
        let patternString = "^1[3|4|5|7|8][0-9]\\d{8}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", patternString)
        return predicate.evaluate(with: string)
    }
    
    /// 判断密码是否合法
    static func iawIsValidPasswod(_ string: String) -> Bool {
        // 验证密码是 6 - 16 位字母或数字
        let patternString = "^[0-9A-Za-z]{6,16}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", patternString)
        return predicate.evaluate(with: string)
    }
    /// 判断是否是邮箱
    func iawValidateEmail() -> Bool {
        let emailRegex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
    /// 判断是否是手机号
    func iawValidateMobile() -> Bool {
        let phoneRegex: String = "^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0,0-9]))\\d{8}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
    }
    
    static func iawClassName(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    func iawSubstring(_ from: Int) -> String {
        return self.substring(from: self.index(self.startIndex, offsetBy: from))
    }
    
    var iawLength: Int {
        return self.count
    }
    //数组转String 符号分隔 ，比如逗号
    func iawToArray(symbol:String)->[String]{
        var arrays = [String]()
        if self != ""{
            arrays = (self.components(separatedBy: symbol))
        }
        return arrays
    }
    
    //获取document目录
    func docDir() -> String
    {
        let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString
        let filePath = docPath.appendingPathComponent((self as NSString).lastPathComponent)
        return filePath
    }
    //获取cache目录
    func cacheDir() -> String
    {
        let cache = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString
        let filePath = cache.appendingPathComponent((self as NSString).lastPathComponent)
        return filePath
    }
    //获取临时目录
    func tempDir() -> String
    {
        let temp = NSTemporaryDirectory() as NSString
        let filePath = temp.appendingPathComponent((self as NSString).lastPathComponent)
        return filePath
    }

}
