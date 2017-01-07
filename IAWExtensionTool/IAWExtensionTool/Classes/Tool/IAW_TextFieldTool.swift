//
//  IAW_TextFieldTool.swift
//  IAWExtensionTool
//
//  Created by winston on 17/1/6.
//  Copyright © 2017年 winston. All rights reserved.
//

import Foundation
open class IAW_TextFieldTool{
    
    open class func getTextFieldValue(_ v:UIView,tag:Int)->String{
        let tf = v.viewWithTag(tag) as! UITextField
        return tf.text!
    }
    
    open class func resetTextFieldValue(_ v:UIView,tag:Int){
        setTextFieldValue(v, tag: tag, value: "")
    }
    
    open class func setTextFieldValue(_ v:UIView,tag:Int,value:String){
        let tf = v.viewWithTag(tag) as! UITextField
        tf.text = value
    }
 
    
}
