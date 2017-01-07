//
//  ResponseModels.swift
//  CtkApp
//
//  Created by winston on 16/12/9.
//  Copyright © 2016年 winston. All rights reserved.
//

// 处理data是集合
import Foundation
import ObjectMapper
open class IAW_ResponseModels<T:Mappable>: Mappable {
    //    private boolean success; //请求是否成功标志
    //    private String accessToken;//返回的token
    //    private String msg;//请求返回的消息
    //    private boolean tokenInvalid;
    //    private int page;
    //    private T data;  //服务端如果用map record 而不是当前的实体类的话，key必须是data 否则移动不能转换成实体
    var success : Bool?
    var accessToken : String?
    var msg : String?
    var tokenInvalid : Bool?
    var vipInvalid :Bool?
    var page : Int?
    var data : [T]?
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
