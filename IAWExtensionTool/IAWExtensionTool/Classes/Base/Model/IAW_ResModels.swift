//
//  IAW_ResModels.swift
//  LeisureAssistant
//
//  Created by winston on 2017/4/17.
//  Copyright © 2017年 winston. All rights reserved.
//

import Foundation
import ObjectMapper
open class IAW_ResModels<T:Mappable> : IAW_BaseModel<T>{
    var success : Bool = false
    var msg : String = ""
    var datas : [T]?
    var tokenInvalid :Bool = false
    var page:Int?
    required public init?(map: Map){
        super.init(map: map)
    }
    public override func mapping(map: Map) {
        success <- map["success"]
        msg <- map["msg"]
        datas <- map["data"]
        tokenInvalid <- map["tokenInvalid"]
        page <- map["page"]
    }
    override func getMsg() -> String {
        return self.msg
    }
    
    override func isSuccess() -> Bool {
        return self.success
    }
    
    override func getDatas() -> [T]? {
        return self.datas
    }
    override func isTokenInvalid() -> Bool {
        return self.tokenInvalid
    }
    
    override func getPage() -> Int? {
        return self.page
    }

}
