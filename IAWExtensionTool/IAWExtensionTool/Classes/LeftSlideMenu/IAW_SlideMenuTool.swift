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
    open class func addLeftBarItem(target:UIViewController,leftMargin:CGFloat = 10,leftMenuImg:UIImage = IAW_ImgXcassetsTool.cehua.image){
        weak var weakSelf = target
        let leftSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil,                                action: nil)
        leftSpace.width = leftMargin
        let leftButton: UIBarButtonItem = UIBarButtonItem(image: leftMenuImg, style: UIBarButtonItemStyle.plain, target: weakSelf, action: #selector(weakSelf!.toggleLeft))
        //        navigationItem.leftBarButtonItem = leftButton
        weakSelf?.navigationItem.setLeftBarButtonItems([leftSpace,leftButton], animated: true)
    }
    
    /**
     * 给带侧边栏的NavBar添加右边按钮
     */
    open class func setMarginRightBar(target:UIViewController,rightBar:UIBarButtonItem,rightMargin:CGFloat = 15){
        weak var weakSelf = target
        let rightSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil,                                action: nil)
        rightSpace.width = rightMargin
        weakSelf?.navigationItem.setRightBarButtonItems([rightSpace,rightBar], animated: true)
    }

}
