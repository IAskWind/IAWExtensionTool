//
//  IAW_SlideMenuTool.swift
//  IAWExtensionTool
//
//  Created by winston on 17/1/23.
//  Copyright © 2017年 winston. All rights reserved.
//

import Foundation
import SlideMenuControllerSwift
open class IAW_SlideMenuTool{
    
    /**
     * 给侧边栏添加触发按钮     *
     */
    open class func addLeftBarItem(target:UIViewController,leftMargin:CGFloat = 10,leftMenuImg:UIImage = IAW_ImgXcassetsTool.ic_menu_black_24dp.image){
        weak var weakSelf = target
        let leftSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil,                                action: nil)
        leftSpace.width = leftMargin
        let leftButton: UIBarButtonItem = UIBarButtonItem(image: leftMenuImg, style: UIBarButtonItemStyle.plain, target: weakSelf, action: #selector(weakSelf!.toggleLeft))
        //        navigationItem.leftBarButtonItem = leftButton
        weakSelf?.navigationItem.setLeftBarButtonItems([leftSpace,leftButton], animated: true)
    }

}
