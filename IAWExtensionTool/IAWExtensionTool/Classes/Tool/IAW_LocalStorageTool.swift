//
//  IAW_LocalStorageTool.swift
//  IAWExtensionTool
//  T对象实体 需要实现 NSObject,NSCoding 详细请参考 `IAW_Sample_T`
//  Created by IAskWind on 2017/9/11.
//  Copyright © 2017年 winston. All rights reserved.
//

import Foundation

open class IAW_LocalStorageTool<T>{
    //归档数组对象
    open class func setLSValues(key:String,values : [T])
    {
        NSKeyedArchiver.archiveRootObject(values, toFile: key.docDir())
    }
    
    //解档数组对象
    open class func getLSValues(key:String) -> [T]?
    {
        return NSKeyedUnarchiver.unarchiveObject(withFile: key.docDir()) as? [T]
    }
    //归档对象
    open class func setLSValue(key:String,value : T)
    {
        NSKeyedArchiver.archiveRootObject(value, toFile: key.docDir())
    }
    
    //解档对象
    open class func getLSValue(key:String) -> T?
    {
        return NSKeyedUnarchiver.unarchiveObject(withFile: key.docDir()) as? T
    }
    
    
    
}
