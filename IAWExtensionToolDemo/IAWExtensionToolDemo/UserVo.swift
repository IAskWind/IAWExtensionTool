//
//  UserInfo.swift
//  CtkApp
//
//  Created by winston on 16/12/9.
//  Copyright © 2016年 winston. All rights reserved.
//

import Foundation
import ObjectMapper
class UserVo: Mappable {
    var pNo: String = "" //手机号码
    var name : String = "" //姓名
    var scName : String = "" //学校名称
    var grade : String = "" //年级
    var createDate : String = "" //创建日期
    var qqNo : String = "" // qq号码
    var mailAddr : String = "" // 邮件地址
    var avatar : String = "" // 头像
    required init?(map: Map){
        
    }
    
    init() {
        
    }
    
    func mapping(map: Map) {
        pNo <- map["pNo"]
        name <- map["name"]
        scName <- map["scName"]
        grade <- map["grade"]
        createDate <- map["createDate"]
        qqNo <- map["qqNo"]
        mailAddr <- map["mailAddr"]
        avatar <- map["avatar"]
        
    }
}
