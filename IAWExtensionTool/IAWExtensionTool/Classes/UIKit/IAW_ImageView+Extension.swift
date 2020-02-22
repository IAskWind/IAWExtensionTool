//
//  IAWImageView.swift
//  IAWExtensionTool
//
//  Created by winston on 16/11/17.
//  Copyright © 2016年 winston. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {

   open func iawCircleHeader(_ url: String,radius:Int){
        if url != "" {
            self.kf.setImage(with: URL(string:url)!, placeholder: IAW_ImgXcassetsTool.headerPhoto.image)
        }else{
            self.image = IAW_ImgXcassetsTool.headerPhoto.image
        }
        self.layer.cornerRadius = CGFloat(radius)
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
        self.layer.masksToBounds = true
    }
    open func showView(){
    
    
    }
    
    // 360度旋转图片
    open func rotate360Degree() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z") // 让其在z轴旋转
        rotationAnimation.toValue = NSNumber(value: .pi * 2.0) // 旋转角度
        rotationAnimation.duration = 0.6 // 旋转周期
        rotationAnimation.isCumulative = true // 旋转累加角度
        rotationAnimation.repeatCount = MAXFLOAT // 旋转次数
        layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    // 停止旋转
    func stopRotate() {
        layer.removeAllAnimations()
    }

}
