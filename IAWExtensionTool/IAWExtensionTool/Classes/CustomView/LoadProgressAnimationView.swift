//
//  LoadProgressAnimationView.swift
//  CtkApp
//
//  Created by winston on 16/12/9.
//  Copyright © 2016年 winston. All rights reserved.
//

import UIKit

open class LoadProgressAnimationView: UIView {
    
    var viewWidth: CGFloat = 0
    override open var frame: CGRect {
        willSet {
            if frame.size.width == viewWidth {
                self.isHidden = true
            }
            super.frame = frame
        }
    }
    
     init(bgColor:UIColor,frame: CGRect) {
        super.init(frame: frame)
        
        viewWidth = frame.size.width
        backgroundColor = bgColor
        self.frame.size.width = 0
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startLoadProgressAnimation() {
        self.frame.size.width = 0
        isHidden = false
        weak var tmpSelf = self
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            tmpSelf?.frame.size.width = (tmpSelf?.viewWidth)! * 0.6
            
            }, completion: { (finish) -> Void in
                
                let time = DispatchTime.now() + Double(Int64(0.4 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
                DispatchQueue.main.asyncAfter(deadline: time, execute: { () -> Void in
                    UIView.animate(withDuration: 0.3, animations: { () -> Void in
                        tmpSelf?.frame.size.width = (tmpSelf?.viewWidth)! * 0.8
                    })
                })
        })
        
    }
    
    func endLoadProgressAnimation() {
        weak var tmpSelf = self
        
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            tmpSelf!.frame.size.width = tmpSelf!.viewWidth
            }, completion: { (finish) -> Void in
                tmpSelf?.isHidden = true
        })
    }
}

