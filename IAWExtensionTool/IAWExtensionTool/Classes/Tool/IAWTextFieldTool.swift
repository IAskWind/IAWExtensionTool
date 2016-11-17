//
//  DWTextFieldTool.swift
//  DWExtensionTool
//
//  Created by winston on 16/11/16.
//  Copyright © 2016年 winston. All rights reserved.
//

import Foundation
open class IAWTextFieldTool{
    
   open class func getTextFieldValue(_ v:UIView,tag:Int)->String{
        let tf = v.viewWithTag(tag) as! UITextField
        return tf.text!
    }
    
   open class func resetTextField(_ v:UIView,tag:Int){
        let tf = v.viewWithTag(tag) as! UITextField
        tf.text = ""
    }
    
   open class func setTextFieldValue(_ v:UIView,tag:Int,value:String){
        let tf = v.viewWithTag(tag) as! UITextField
        tf.text = value
    }
 

}
