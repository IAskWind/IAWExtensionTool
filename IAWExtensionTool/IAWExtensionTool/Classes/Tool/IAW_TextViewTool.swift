//
//  IAW_TextViewTool.swift
//  IAWExtensionTool
//
//  Created by winston on 17/1/6.
//  Copyright © 2017年 winston. All rights reserved.
//

import Foundation
open class IAW_TextViewTool{
    
    open class func getTextViewValue(_ v:UIView,tag:Int)->String{
        let tf = v.viewWithTag(tag) as! UITextView
        return tf.text!
    }
    //textview有时候需要一个placehoder
    open class func resetTextViewValue(_ v:UIView,tag:Int,value:String,placeholderTag:Int = 0){
        setTextViewValue(v,tag: tag,value: "")
    }
    
    open class func setTextViewValue(_ v:UIView,tag:Int,value:String,placeholderTag:Int = 0){
        let tf = v.viewWithTag(tag) as! UITextView
        tf.text = value
        if placeholderTag != 0{
            let label = v.viewWithTag(placeholderTag) as! UILabel
            label.isHidden = false
        }
    }
    //需要在 func textViewDidChange(_ textView: UITextView) 方法里调用，判断textview的text大小，来显示和隐藏 来达到placeHolder
    open class func dealTextViewPlaceHolder(dealView:UIView,textView: UITextView,placeholderTag:Int){
        if let label = dealView.viewWithTag(placeholderTag) as? UILabel{
            if textView.text.iawLength == 0{
                label.isHidden = false
            }else{
                label.isHidden = true
            }
            
        }
    }
    
    open class func dealCommonTextView(_ target: UIViewController,dealView:UIView,title:String,placeholder:String,textViewTag:Int,placeholderTag:Int){
        weak var weakSelf = target
        dealView.width = IAW_ScreenW
        dealView.backgroundColor = UIColor.white
        let styleLabel = IAW_LabelTool.setUpLabel(title)
        dealView.addSubview(styleLabel)
        styleLabel.snp.makeConstraints{
            (make) in
            make.top.equalTo(dealView)
            make.left.equalTo(dealView).offset(10)
            make.height.equalTo(IAW_LabelTool.labelHeight)
            make.width.equalTo(80)
        }
        let commonTextView = UITextView()
        commonTextView.font = UIFont.systemFont(ofSize: 14)
        commonTextView.delegate = weakSelf as! UITextViewDelegate?
        commonTextView.layer.borderWidth = 1
        commonTextView.layer.borderColor = UIColor.lightGray.cgColor
        
        commonTextView.tag = textViewTag
        dealView.addSubview(commonTextView)
        commonTextView.snp.makeConstraints{
            (make) in
            //                make.top.left.equalTo(mainScrollView).offset(10)
            make.left.equalTo(dealView).offset(10)
            make.top.equalTo(styleLabel.snp.bottom)
            make.width.equalTo(IAW_ScreenW - 20)
            make.bottom.equalTo(dealView).offset(-10)
        }
        
        let commonTextViewPlaceholder = UILabel()
        commonTextViewPlaceholder.textColor = UIColor.lightGray
        commonTextViewPlaceholder.font = UIFont.systemFont(ofSize: 14)
        commonTextViewPlaceholder.sizeToFit()
        commonTextViewPlaceholder.text = placeholder
        commonTextViewPlaceholder.tag = placeholderTag
        dealView.addSubview(commonTextViewPlaceholder)
        commonTextViewPlaceholder.snp.makeConstraints{
            (make) in
            make.top.left.equalTo((commonTextView)).offset(5)
        }
        
    }

    
}
