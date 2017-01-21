//
//  IAWWeatherTool.swift
//  CtkApp
//
//  Created by winston on 16/12/14.
//  Copyright © 2016年 winston. All rights reserved.
//

import UIKit


open class IAW_FullScreenTool{
    
    /**
     *设置全屏显示的效果，在app上加个全局的可穿透的蒙层
     * 下雨 下雪 下妹子等
     *
     */
    open class func showEffect(imgEffect:UIImage,window:UIWindow?){
        let snow = ParticleView(imgEffect: imgEffect,frame: CGRect(x: 0, y: 0, width:UIScreen.iawWidth, height: UIScreen.iawHeight))
//        snow.imgName = "snowflake1"
        //        snow.backgroundColor = UIColor.blue
        let snowClipView = UIView(frame: snow.frame.offsetBy(dx: 0, dy: 0))
        snowClipView.clipsToBounds = true
        //        snowClipView.backgroundColor = UIColor.red
        snowClipView.addSubview(snow)
        snow.isUserInteractionEnabled = false //事件穿透
        snowClipView.isUserInteractionEnabled = false//事件穿透
        window?.addSubview(snowClipView)
    }
}
