//
//  IAW_responseMsgModel.swift
//  LeisureAssistant
//
//  Created by winston on 2017/4/17.
//  Copyright © 2017年 winston. All rights reserved.
//

import Foundation
import ObjectMapper
class IAW_ResMsgModel<T> : IAW_BaseModel<T>{
    var success : Bool = false
    var msg : String = ""
    var dataStr:String = ""
    
    var tokenInvalid :Bool = false
    required public init?(map: Map){
        super.init(map: map)
    }
    public override func mapping(map: Map) {
        success <- map["success"]
        msg <- map["msg"]
        dataStr <- map["data"]
        tokenInvalid <- map["tokenInvalid"]
    }
    override func getMsg() -> String {
        return self.msg
    }
    
    override func isSuccess() -> Bool {
        return self.success
    }
    
    override func getDataStr() -> String {
        return self.dataStr
    }
    override func isTokenInvalid() -> Bool {
        return self.tokenInvalid
    }
  }
