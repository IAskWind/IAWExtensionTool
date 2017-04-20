//
//  EditViewController.swift
//  WingBid
//
//  Created by winston on 16/10/6.
//  Copyright © 2016年 winston. All rights reserved.
//

import UIKit
import OMExtension
public protocol EditTextViewDelegate: NSObjectProtocol {
    func editClick(editKey: String,editValue:String)
}
// key value的形式 key实际就是title value
 
open class IAW_EditTextViewController: IAW_BaseViewController {
    var editKey:String = ""
    var editValue: String = ""
    weak var delegate: EditTextViewDelegate?
    override open func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initUI()
      
    }
    override open func viewWillAppear(_ animated: Bool) {
        editTextfield.text = editValue
    }
    func initUI(){
        setRightBarBtn()
        view.addSubview(editTextfield)
        editTextfield.snp.makeConstraints{
            (make) in
                make.top.equalTo(10)
                make.width.equalTo(view)
                make.height.equalTo(40)
            
        }
    }
    
    func setRightBarBtn(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存", style: .plain, target: self, action: #selector(rightBarBtnClick))
    }
    
    private lazy var editTextfield:UITextField = {
        let editTextfield = UITextField()
        editTextfield.clearButtonMode = .always
        editTextfield.leftView = UIView(frame: CGRect(x:0,y:0,width:8,height:0))
        editTextfield.leftViewMode = .always
        editTextfield.backgroundColor = UIColor.white
        editTextfield.textColor = UIColor.iaw_Color(0, g: 0, b: 0, a: 0.6)
        editTextfield.font = UIFont.systemFont(ofSize: 16)
        editTextfield.om.addTextLimit(length: 20)
        return editTextfield
    }()
    
    func rightBarBtnClick(){
        if (editTextfield.text?.isEmpty)! {
            IAW_ProgressHUDTool.showErrorInfo(msg: "\(navigationItem.title!)不能为空！")
            return
        }
        if(editValue == editTextfield.text!){//没有改变直接关闭
            _ = self.navigationController?.popViewController(animated: true)
            return
        }
        delegate?.editClick(editKey: editKey,editValue:editTextfield.text!)
    }
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
