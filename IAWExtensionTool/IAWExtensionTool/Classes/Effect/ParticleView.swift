//
//  SnowView.swift
//  CtkApp
//
//  Created by winston on 16/12/14.
//  Copyright © 2016年 winston. All rights reserved.
//

import UIKit

class ParticleView: UIView, Particle {
//    var imgName:String = ""
//    
     init(imgEffect: UIImage,frame: CGRect) {
        super.init(frame: frame)
        
        createParticle(imgEffect: imgEffect)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class var layerClass: AnyClass {
        return CAEmitterLayer.self
    }
}
