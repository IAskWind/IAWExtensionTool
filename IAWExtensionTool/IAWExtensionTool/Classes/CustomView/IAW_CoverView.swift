//
//  IAW_CoverView.swift
//  LeisureAssistant_U
//  遮罩层处理
//  Created by winston on 2017/5/14.
//  Copyright © 2017年 iaskwind. All rights reserved.
//
//
import UIKit
public protocol IAW_CoverViewDelegate: NSObjectProtocol {
    // 点击蒙板的时候调用
    func coverDidClickCover(_ cover: IAW_CoverView)
}
open class  IAW_CoverView: UIView {
    /**
     *  显示蒙板
     */
    // 设置浅灰色蒙板
    var isDimBackground: Bool = false{
        didSet{
            if isDimBackground {
                backgroundColor = UIColor.black
                alpha = 0.5
            }
            else {
                alpha = 1
                backgroundColor = UIColor.clear
            }
        }
    }
    public weak var delegate: IAW_CoverViewDelegate?
    open class func showAdd(_ view: UIView = IAW_Window,y:CGFloat = 0,height:CGFloat = IAW_ScreenH) -> IAW_CoverView {
        let cover = IAW_CoverView(frame: CGRect(x: 0, y: y, width: IAW_ScreenW, height: height - y))
        cover.backgroundColor = UIColor.black
        cover.alpha = 0.5
        cover.isUserInteractionEnabled = true
        view.addSubview(cover)
        return cover
        
    }
    /**
     *  隐藏蒙板
     */
    open class func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view.subviews {
            if (cover.isKind(of: self)) {
                cover.removeFromSuperview()
            }
        }
    }
    // 点击蒙板的时候做事情
    override open func touchesBegan(_ touches:Set<UITouch>, with event: UIEvent?) {
        // 移除蒙板
        //        removeFromSuperview()
        // 通知代理移除菜单
        //        if (delegate?.responds(to: #selector("coverDidClickCover")))! {
        delegate?.coverDidClickCover(self)
        //        }
    }
    
}
