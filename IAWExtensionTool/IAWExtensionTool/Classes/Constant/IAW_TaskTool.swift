//
//  IAW_TaskTool.swift
//  IAWExtensionTool
//  任务处理
//  Created by winston on 17/3/24.
//  Copyright © 2017年 winston. All rights reserved.
//

import Foundation
open class IAW_TaskTool{
    
    public typealias Task = (_ cancel : Bool) -> Void
    
    open class func delay(_ time: TimeInterval, task: @escaping ()->()) ->  Task? {
        
        func dispatch_later(block: @escaping ()->()) {
            let t = DispatchTime.now() + time
            DispatchQueue.main.asyncAfter(deadline: t, execute: block)
        }
        var closure: (()->Void)? = task
        var result: Task?
        
        let delayedClosure: Task = {
            cancel in
            if let internalClosure = closure {
                if (cancel == false) {
                    DispatchQueue.main.async(execute: internalClosure)
                }
            }
            closure = nil
            result = nil
        }
        
        result = delayedClosure
        
        dispatch_later {
            if let delayedClosure = result {
                delayedClosure(false)
            }
        }
        return result
    }
    
    open class func cancel(_ task: Task?) {
        task?(true)
    }
}
