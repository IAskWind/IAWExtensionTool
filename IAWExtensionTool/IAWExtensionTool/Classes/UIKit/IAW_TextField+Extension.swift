//
//  IAWTextField.swift
//  IAWExtensionTool
//
//  Created by winston on 16/11/15.
//  Copyright © 2016年 winston. All rights reserved.
//
import Foundation
import UIKit
extension UITextField {
    
    open func iawSetLimit(_ length: Int) {
        
        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: nil, queue: OperationQueue.main) { (notification) in
            
            if (((self.text?.count)! > length) && self.markedTextRange == nil) {
                
                self.text = (self.text! as NSString).substring(to: length)
                
            }
        }
    }
    //包含小数点
    open func addLimit(numLength: Int,decimalLength:Int = 0,limitHandler: (() -> Void)? = nil){
        
        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: nil, queue: OperationQueue.main) { (notification) in
            let strs =  self.text!.components(separatedBy: ".")
            if (strs.count > 2){ //防止输入多个小数点
                self.text = (self.text! as NSString).substring(to: (self.text?.iawLength)! - 1)
                limitHandler?()
                return
            }
            var subStr = ""
            if strs[0].iawLength > numLength && self.markedTextRange == nil {
                subStr.append((strs[0] as NSString).substring(to: numLength))
            }
            if strs.count == 2  && self.markedTextRange == nil {
                if strs[1].iawLength > decimalLength {
                    subStr.append(strs[0])
                    subStr.append(".")
                    subStr.append((strs[1] as NSString).substring(to: decimalLength))
                }
                else {
                    if !subStr.isEmpty {
                        subStr.append(".")
                        subStr.append(strs[1])
                        
                    }
                }
            }
            if !subStr.isEmpty {
                self.text = subStr
            }
            limitHandler?()
        }
    }
}
