//
//  BaseModel.swift
//  LeisureAssistant
//
//  Created by winston on 17/3/21.
//  Copyright © 2017年 winston. All rights reserved.
//

import Foundation
import ObjectMapper
open class IAW_BaseModel<T>:Mappable{
    
    private var success : Bool = false
    private var msg : String = ""
    private var data : T?
    private var tokenInvalid :Bool = false
    private var accessToken : String = ""
    private var dataStr: String = ""
    private var datas : [T]?
    private var page : Int?
    required public init?(map: Map){
        
    }
    open func mapping(map: Map) {
        
    }
    open func isSuccess()->Bool{
        return self.success
    }
    
    open func getMsg()->String{
        return self.msg
    }
    
    open func getPage()->Int?{
        return self.page
    }
    
    open func getDataStr()->String{
        return self.dataStr
    }
    
    open func getData()->T?{
        return self.data
    }
    
    open func getDatas()->[T]?{
        return self.datas
    }
    
    open func isTokenInvalid()->Bool{
        return self.tokenInvalid
    }
    
    open func getAccessToken()->String{
        return self.accessToken
    }
    
}
