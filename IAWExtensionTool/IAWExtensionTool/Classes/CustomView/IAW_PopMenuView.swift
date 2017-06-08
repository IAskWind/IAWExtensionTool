//
//  IAWPopMenuView.swift
//  LeisureAssistant_U
//
//  Created by winston on 2017/5/14.
//  Copyright © 2017年 iaskwind. All rights reserved.
//
//func rightBarBtnClick(){
//    let cover  = IAW_CoverView.showAdd(y:20)
//    cover.delegate = self
//    let rightMenu = IAW_PopMenuView.show(in: CGRect(x: CGFloat(IAW_ScreenW - IAW_PX(px: 540)), y: 20, width: IAW_PX(px: 540), height: IAW_ScreenH - 20))
//    rightMenu.setContent(rightVC.view)
//    rightVC.dismissViewsAction = {(_ sexType: Int, _ ageMin: Int, _ ageMax: Int, _ distanceMax: Int) -> Void in
//    }
//}
//func coverDidClickCover(_ cover: IAW_CoverView) {
//    IAW_PopMenuView.hide()
//    IAW_CoverView.hide()
//}


import UIKit
class IAW_PopMenuView: UIView {
    /**
     *  显示弹出菜单
     */
    // 内容视图
    weak var contentView: UIView?
    class func show(in rect: CGRect, from view: UIView = IAW_Window) -> IAW_PopMenuView {
        let menu = IAW_PopMenuView(frame: rect)
        menu.isUserInteractionEnabled = true
        menu.backgroundColor = UIColor.white
        view.addSubview(menu)
        return menu
    }
    /**
     *  隐藏弹出菜单
     */
    class func hide(from view: UIView = IAW_Window) {
        for popMenu: UIView in view.subviews {
            if (popMenu .isKind(of: self)) {
                popMenu.removeFromSuperview()
            }
        }
    }
    // 设置内容视图
    func setContent(_ contentView: UIView) {
        // 先移除之前内容视图
        self.contentView?.removeFromSuperview()
        self.contentView = contentView
        contentView.backgroundColor = UIColor.clear
        addSubview(contentView)
    }
}
