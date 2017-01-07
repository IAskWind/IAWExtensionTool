//
//  ResponseModel.swift
//  CtkApp
//
//  Created by winston on 16/12/9.
//  Copyright © 2016年 winston. All rights reserved.
//

//data是实体类
import Foundation
import ObjectMapper
open class IAW_ResponseModel<T:Mappable>: Mappable {
    var success : Bool?
    var accessToken : String?
    var msg : String?
    var tokenInvalid : Bool?
    var vipInvalid :Bool?
    var page : Int?
    var data : T?
    required public init?(map: Map){
        
    }
    
    public func mapping(map: Map) {
        success <- map["success"]
        accessToken <- map["accessToken"]
        msg <- map["msg"]
        tokenInvalid <- map["tokenInvalid"]
        vipInvalid <- map["vipInvalid"]
        page <- map["page"]
        data <- map["data"]
        
    }
    
    
}

