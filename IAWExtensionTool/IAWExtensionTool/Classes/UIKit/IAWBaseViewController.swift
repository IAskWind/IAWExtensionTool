//
//  IAWBaseViewController.swift
//  IAWExtensionTool
//
//  Created by winston on 16/11/17.
//  Copyright © 2016年 winston. All rights reserved.
//

import Foundation
import SVProgressHUD
import SnapKit
open class IAWBaseViewController: UIViewController,UIGestureRecognizerDelegate {
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        if SVProgressHUD.isVisible() {
            SVProgressHUD.dismiss()
        }
        view.backgroundColor = UIColor.iawGlobalColor
//        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
//        SVProgressHUD.setMinimumDismissTimeInterval(1.0)
//        SVProgressHUD.setBackgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5))
//        SVProgressHUD.setForegroundColor(UIColor.white)
         IAWProgressHUDTool.initProgressHUD()
        //处理软键盘
        NotificationCenter.default.addObserver(self, selector:#selector(keyBoardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(keyBoardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        clickViewHideSoftKeyBoard()
        //
        
    }
    //http://www.jianshu.com/p/8c8a5e839b0a
    //不能放在父控件,会影响tableview，导致其cell不能点击
    func clickViewHideSoftKeyBoard(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backViewTap))
        tapGesture.delegate=self
        tapGesture.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapGesture)
        
    }
    //MARK: 重写手势让tableview能点击
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("*****************\(touch.view!.superview?.superview is UICollectionView)")
        if NSStringFromClass(touch.view!.classForCoder) == "UITableViewCellContentView" || touch.view!.superview?.superview is UICollectionView {
            return false
        }
        return true
    }
    //点击界面 隐藏键盘
    func backViewTap(){
        view.endEditing(true)
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    func keyBoardWillShow(note:NSNotification){
        
    }
    func keyBoardWillHide(note:NSNotification)
    {
        
    }
    
    deinit {
        // 控制器销毁时，移除消息通知监听(必须)
        NotificationCenter.default.removeObserver(self);
    }
    
    func keyBoardUpdateView(constraint:Constraint,notification:NSNotification,offsetKeyBoardValue:CGFloat = 0){
        
        if let userInfo = notification.userInfo,
            let value = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue,
            let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? Double,
            let curve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? UInt {
            let frame = value.cgRectValue
            let intersection = frame.intersection(self.view.frame)
            constraint.update(offset: -intersection.height + offsetKeyBoardValue)
            UIView.animate(withDuration: duration, delay: 0.0,
                           options: UIViewAnimationOptions(rawValue: curve),
                           animations: { _ in
                            self.view.layoutIfNeeded()
                }, completion: nil)
        }
        
    }
    
}
