//
//  IAW_UITool.swift
//  IAWExtensionTool
//
//  Created by winston on 17/1/6.
//  Copyright © 2017年 winston. All rights reserved.
//  ui操作 包括 toTabBar 退出登录(清除Token)
//

import Foundation
import SlideMenuControllerSwift
open class IAW_UITool{
    ///childVcArray  第一个参数chindviewcontroller，第二个参数title,第三个imageName
    open class func toTabBar(_ target: UIViewController,transitionStyle:UIModalTransitionStyle,childVcArray:[(String,String,String,Bool)]){
        weak var weakSelf = target
        let tabBar = IAW_TabBarController();
        tabBar.childVcArray = childVcArray
        tabBar.modalTransitionStyle = transitionStyle
        weakSelf?.present(tabBar, animated: true, completion: nil)
    }
    
    open class func loginOut(_ target: UIViewController){
        weak var weakSelf = target
        UserDefaults.standard.set("", forKey: IAW_AccessToken)
        weakSelf?.dismiss(animated: true, completion: nil)
    }
//    // 带侧边栏 带底部tabbar
//    //注意：用在AppDelegate的调用 //并且返回的UIWindow要赋值给AppDelegate声明的
    open class func rootToTabBarAndSlideMenu(window:UIWindow,leftVC: UIViewController,transitionStyle:UIModalTransitionStyle,childVcArray:[(String,String,String,Bool)],tabBarTintColor:UIColor,navBarTintColor:UIColor,navBarTitleFontSize:CGFloat = 15){
//        weak var weakSelf = target
        let tabBar = IAW_TabBarController(childVcArray:childVcArray,tabBarTintColor:tabBarTintColor,navBarTintColor:navBarTintColor,navBarTitleFontSize:navBarTitleFontSize)
        SlideMenuOptions.contentViewScale = 1
//                SlideMenuOptions.contentViewOpacity = 0.5 //背景通明度
        let slideMenuController = IAW_SlideMenuController(mainViewController: tabBar, leftMenuViewController: leftVC)
        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        slideMenuController.delegate = tabBar
        slideMenuController.modalTransitionStyle = transitionStyle
        IAW_AppTool.rootVC(mWindow: window,vc: slideMenuController)
        
    }
    
    open class func rootMainAndSlideMenu(window:UIWindow,leftVC: UIViewController,transitionStyle:UIModalTransitionStyle,mainVC:UIViewController & SlideMenuControllerDelegate ,tabBarTintColor:UIColor,navBarTintColor:UIColor,navBarTitleFontSize:CGFloat = 15){
            let slideMenuController = IAW_SlideMenuController(mainViewController: mainVC, leftMenuViewController: leftVC)
            slideMenuController.automaticallyAdjustsScrollViewInsets = true
            slideMenuController.delegate = mainVC
            slideMenuController.modalTransitionStyle = transitionStyle
            IAW_AppTool.rootVC(mWindow: window,vc: slideMenuController)
            
        }
    
    
    open class func IAW_Label(text:String,textColor:UIColor = UIColor.black,fontSize:CGFloat = 11)->UILabel{
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: fontSize)
        return label
    }
    //lineSpacing 多行之间的行间距
    open class func IAW_LabelNumLine(text:String,textColor:UIColor = UIColor.black,fontSize:CGFloat = 11,num:Int,lineSpacing:CGFloat = IAW_PX(px: 10))->UILabel{
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        label.numberOfLines = num
        label.font = UIFont.systemFont(ofSize: fontSize)
        let attributedString = NSMutableAttributedString(string: label.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        //调整行间距
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: (label.text?.iawLength)!))
        label.attributedText = attributedString
        return label
    }
    
    open class func IAW_LabelMoreLine(text:String,textColor:UIColor = UIColor.black,fontSize:CGFloat = 11)->UILabel{
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: fontSize)
        return label
    }
    open class func IAW_Button(button:UIButton = UIButton(),text:String,textColor:UIColor = UIColor.white,fontSize:CGFloat = IAW_PX(px: 30),bgColor:UIColor = IAW_GlobalNavBarColor,cornerRadius:CGFloat = 0,controlState:UIControl.State = UIControl.State())->UIButton{
        button.backgroundColor = bgColor
        button.setTitleColor(textColor, for: controlState)
        button.layer.cornerRadius = cornerRadius
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        button.setTitle(text, for: controlState)
        return button
    }
//    open class func IAW_TextField(_ placeholder:String,fontSize:CGFloat = 11,fontColor:UIColor = UIColor.black ,clearButton:UITextFieldViewMode = UITextFieldViewMode.never,keyboardType:UIKeyboardType=UIKeyboardType.default)->UITextField{
//        let textField = UITextField()
//        textField.returnKeyType = .done
//        textField.keyboardType = keyboardType
//        textField.clearButtonMode = clearButton
//        textField.backgroundColor = UIColor.white
//        textField.placeholder = placeholder
//        textField.font = UIFont.systemFont(ofSize: fontSize)
//        textField.textColor = fontColor
//        return textField
//    }
    
    open class func IAW_TextField(_ placeholder:String,fontSize:CGFloat = IAW_PX(px: 24),fontColor:UIColor = IAW_HEXColor("#545454") ,placeholderColor:UIColor = IAW_HEXColor("#aaaaaa"),placeholderFontSize:CGFloat = IAW_PX(px: 22),clearButton:UITextField.ViewMode = UITextField.ViewMode.never,keyboardType:UIKeyboardType=UIKeyboardType.default,placeholderAlign:NSTextAlignment = NSTextAlignment.left)->UITextField{
        let textField = UITextField()
        textField.returnKeyType = .done
        textField.keyboardType = keyboardType
        textField.clearButtonMode = clearButton
        textField.backgroundColor = UIColor.white
        textField.font = UIFont.systemFont(ofSize: fontSize)
        textField.textColor = fontColor
        //处理placeholder
        let style = NSMutableParagraphStyle()
        style.alignment = placeholderAlign
        //placeHolder过小不居中解决
        style.minimumLineHeight = (textField.font?.lineHeight)! - ((textField.font?.lineHeight)! - UIFont.systemFont(ofSize: placeholderFontSize).lineHeight) / 2.0
        textField.attributedPlaceholder = NSAttributedString(string:placeholder,attributes:[NSAttributedString.Key.foregroundColor: placeholderColor,NSAttributedString.Key.font:UIFont.systemFont(ofSize: placeholderFontSize),NSAttributedString.Key.paragraphStyle:style])

        return textField
    }
    
    open class func getCurrentVC()->UIViewController{
        
        var window = UIApplication.shared.keyWindow
        if window?.windowLevel != UIWindow.Level.normal{
            let windows = UIApplication.shared.windows
            for  tempwin in windows{
                if tempwin.windowLevel == UIWindow.Level.normal{
                    window = tempwin
                    break
                }
            }
        }
        let frontView = (window?.subviews)![0]
        let nextResponder = frontView.next
        //        Getdevice.println("getCurrentVC    XX \(frontView.classForCoder)")// iOS8 9 window  ios7 UIView
        //        Getdevice.println("getCurrentVC    XX \((window?.subviews)!.count)")
        //        Getdevice.println("getCurrentVC    XX \(nextResponder?.classForCoder)")
        
        if nextResponder?.isKind(of: UIViewController.classForCoder()) == true{
            
            return nextResponder as! UIViewController
        }else if nextResponder?.isKind(of: UINavigationController.classForCoder()) == true{
            
            return (nextResponder as! UINavigationController).visibleViewController!
        }
        else {
            
            if (window?.rootViewController) is UINavigationController{
                return ((window?.rootViewController) as! UINavigationController).visibleViewController!//只有这个是显示的controller 是可以的必须有nav才行
            }else if (window?.rootViewController) is IAW_TabBarController{
                return ((window?.rootViewController) as! UITabBarController).selectedViewController! //不行只是最三个开始的页面
            }
            
            return (window?.rootViewController)!
            
        }
        
    }
    
    public typealias OkFunc = ()->()
    public typealias CancelFunc = ()->()
    
    open class func IAW_Confirm(_ target: UIViewController = IAW_UITool.getCurrentVC(),title:String?,message:String?,okBtnTitle:String = "确定",cancelBtnTitle:String = "取消",okFunc:OkFunc? = nil,cancelFunc:CancelFunc? = nil){
        weak var weakSelf = target
        let alertController = UIAlertController(title: title,
                                                message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: cancelBtnTitle, style: .cancel, handler:{
            action in
            cancelFunc?()
        })
        let okAction = UIAlertAction(title: okBtnTitle, style: .default,
                                     handler: {
                                        action in
                                        okFunc?()
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        weakSelf?.present(alertController, animated: true, completion: nil)
        
    }
    
    open class func IAW_Alert(_ target: UIViewController = IAW_UITool.getCurrentVC(),title:String?,message:String?,okBtnTitle:String = "确定",okFunc:OkFunc? = nil){
        weak var weakSelf = target
        let alertController = UIAlertController(title: title,
                                                message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: okBtnTitle, style: .default,
                                     handler: {
                                        action in
                                        okFunc?()
        })
        alertController.addAction(okAction)
        weakSelf?.present(alertController, animated: true, completion: nil)
        
        
    }



}
