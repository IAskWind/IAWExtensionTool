//
//  ResponseModel.swift
//  LeisureAssistant
//
//  Created by winston on 17/3/21.
//  Copyright © 2017年 winston. All rights reserved.
//

import Foundation
import ObjectMapper
class IAW_ResModel<T:Mappable> : IAW_BaseModel<T>{
    var success : Bool = false
    var msg : String = ""
    var data : T?
    var tokenInvalid :Bool = false
    required public init?(map: Map){
        super.init(map: map)
    }
    override func mapping(map: Map) {
        success <- map["success"]
        msg <- map["msg"]
        tokenInvalid <- map["tokenInvalid"]
        data <- map["data"]
        
    }
    override func getMsg() -> String {
       return self.msg
    }
    
    override func isSuccess() -> Bool {
        return self.success
    }
    
    override func getData() -> T? {
        return self.data
    }
    
    override func isTokenInvalid() -> Bool {
        return self.tokenInvalid
    }
}
