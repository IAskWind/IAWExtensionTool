//
//  IAWTextField.swift
//  IAWExtensionTool
//
//  Created by winston on 16/11/15.
//  Copyright © 2016年 winston. All rights reserved.
//
import Foundation
import UIKit
public extension UITextField {
    
    func iawSetLimit(_ length: Int) {
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UITextFieldTextDidChange, object: nil, queue: OperationQueue.main) { (notification) in
            
            if (((self.text?.characters.count)! > length) && self.markedTextRange == nil) {
                
                self.text = (self.text! as NSString).substring(to: length)
                
            }
        }
    }
}
