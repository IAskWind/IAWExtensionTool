//
//  IAWJsonTool.swift
//  IAWExtensionTool
//
//  Created by winston on 16/11/17.
//  Copyright © 2016年 winston. All rights reserved.
//

import Foundation
import ObjectMapper
//利用objectMapper处理josn和model互相转换
open class IAW_JsonTool<T:Mappable>{
    
    open class func json2Model(jsonStr:String)->T?{
        let model = Mapper<T>().map(JSONString: jsonStr)
        return model
    }
    
    open class func Model2Json(model:T)->String?{
        return model.toJSONString(prettyPrint: true)
    }

}
