//
//  Particle.swift
//
//
//  Created by winston on 16/12/14.
//  Copyright © 2016年 winston. All rights reserved.
//创建粒子效果
//

import Foundation
import UIKit
import QuartzCore

protocol Particle {}

extension Particle where Self: UIView {
    
    func createParticle(imgEffect:UIImage) {
        let emitter = layer as! CAEmitterLayer
        emitter.emitterPosition = CGPoint(x: bounds.size.width / 2, y: 0)
        emitter.emitterSize = bounds.size
        emitter.emitterShape = kCAEmitterLayerRectangle
        
        let emitterCell = CAEmitterCell()
        emitterCell.contents = imgEffect.cgImage
        emitterCell.birthRate = 200
        emitterCell.lifetime = 3.5
        emitterCell.color = UIColor.white.cgColor
        emitterCell.redRange = 0.0
        emitterCell.blueRange = 0.1
        emitterCell.greenRange = 0.0
        emitterCell.velocity = 10
        emitterCell.velocityRange = 350
        emitterCell.emissionRange = CGFloat(M_PI_2)
        emitterCell.emissionLongitude = CGFloat(-M_PI)
        emitterCell.yAcceleration = 70
        emitterCell.xAcceleration = 0
        emitterCell.scale = 0.33
        emitterCell.scaleRange = 1.25
        emitterCell.scaleSpeed = -0.25
        emitterCell.alphaRange = 0.5
        emitterCell.alphaSpeed = -0.15
        
        emitter.emitterCells = [emitterCell]
    }
}
