//
//  IAW_Sample_T.swift
//  IAWExtensionTool
//
//  Created by IAskWind on 2017/9/11.
//  Copyright © 2017年 winston. All rights reserved.
//

import Foundation
import ObjectMapper
class IAW_Sample_T: NSObject,NSCoding,Mappable{
    var id: String = ""
    var name:String = ""
    var dict_type:String = ""
    override init() {
        
    }
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        id <- map["dict_value"]
        name <- map["dict_key"]
        dict_type <- map["dict_type"]
    }
    init(name:String,id:String = "") {
        self.name = name
        self.id = id
        
    }
    
    //数据本地化存储
    //归档
    func encode(with aCoder:NSCoder)
    {
        aCoder.encode(id,forKey: "id")
        aCoder.encode(name,forKey: "name")
        aCoder.encode(dict_type,forKey: "dict_type")
    }
    //解档
    required init(coder deCoder:NSCoder) {
        id =  deCoder.decodeObject(forKey: "id") as! String
        name = deCoder.decodeObject(forKey: "name") as!  String
        dict_type = deCoder.decodeObject(forKey: "dict_type") as! String
    }
    
    
}
