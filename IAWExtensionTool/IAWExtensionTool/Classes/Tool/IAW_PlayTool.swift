//
//  IAW_PlayTool.swift
//  IAWExtensionTool
//
//  Created by IAskWind on 2017/9/11.
//  Copyright © 2017年 winston. All rights reserved.
//

import Foundation
import AVFoundation
open class IAW_PlayTool{
    
    //playAlertSound(sound: "noticeMusic", type: "caf")
    open class func playAlertSound(sound: String, type: String) {
        var soundID: SystemSoundID = 0
        // 获取声音地址
        guard let soundPath = Bundle.main.path(forResource: sound, ofType: type) else { return }
        guard let soundUrl = NSURL(string: soundPath) else { return }
        // 赋值
        AudioServicesCreateSystemSoundID(soundUrl, &soundID)
        // 播放声音
        AudioServicesPlaySystemSound(soundID)
        
    }
    
    
}
