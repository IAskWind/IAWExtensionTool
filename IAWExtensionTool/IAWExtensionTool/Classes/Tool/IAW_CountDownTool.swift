//
//  IAW_CountDownTool.swift
//  IAWExtensionTool
//
//  Created by winston on 17/3/24.
//  Copyright © 2017年 winston. All rights reserved.
//

import Foundation
import CountdownLabel
open class IAW_CountDownTool{
    //倒计时处理
    open class func countDown(countdownLabel:CountdownLabel,fromDate:String,targetDate:String){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let fromDate = formatter.date(from: fromDate)!
        let targetDate = formatter.date(from: targetDate)!
        let diffSeconds = targetDate.timeIntervalSince(fromDate) //targetDate - formdate
        countdownLabel.setCountDownTime(diffSeconds)
        countdownLabel.timeFormat = "mm:ss"
        
    }
    //倒计时处理
    open class func countDown(countdownLabel:CountdownLabel,fromDate:Date,targetDate:String){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let fromDate = fromDate
        let targetDate = formatter.date(from: targetDate)!
        let diffSeconds = targetDate.timeIntervalSince(fromDate) //targetDate - formdate
        countdownLabel.setCountDownTime(diffSeconds)
        countdownLabel.timeFormat = "mm:ss"
        
    }

}
