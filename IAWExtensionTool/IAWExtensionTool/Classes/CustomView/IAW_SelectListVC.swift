//
//  IAWSelectListVC.swift
//  LeisureAssistant
//
//  Created by winston on 17/2/15.
//  Copyright © 2017年 winston. All rights reserved.
//

import UIKit

public protocol IAW_SelectListViewDelegate: NSObjectProtocol {
    func editClick(editKey: String,editValue:(String,String))
}
open class IAW_SelectListVC: IAW_BaseViewController {
    var titleValue :String = ""
    var editKey:String = ""
    var editValue: (String,String) = ("","")
    
    weak var delegate: IAW_SelectListViewDelegate?
    
    var commonDict = Dictionary<String,Any>();
    
    let cellHeight = IAW_PX(px: 84)
    var selectedIndex:IndexPath? = nil
    fileprivate var tableView: UITableView!
    override open func viewDidLoad() {
        self.view.backgroundColor = IAW_HEXColor("#eeeeee")
        initUI()
    }
    
    func initUI(){
        self.automaticallyAdjustsScrollViewInsets = false
        tableView = UITableView(frame: CGRect(x:0,y:0, width:IAW_ScreenW, height:IAW_ScreenH), style: UITableView.Style.grouped)
        tableView.backgroundColor = UIColor(red:245/255, green: 245/255, blue: 245/255, alpha: 1)
        //                tableView.backgroundColor = UIColor.red
        tableView.allowsMultipleSelectionDuringEditing=true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        tableView.rowHeight = cellHeight
        tableView.separatorColor = IAW_HEXColor("#eeeeee")
        tableView.sectionFooterHeight = 0.1
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        view.addSubview(tableView)
        let count = commonDict.count
        
        
        tableView.snp.makeConstraints{
            (make) in
            make.top.equalTo(self.view).offset(0)
            make.left.equalTo(self.view)
            make.width.equalTo(IAW_ScreenW)  // 不需要  行数 * 高度  高
            //            make.bottom.equalTo(self.view).offset(20)
            make.height.equalTo(Int(cellHeight) * count)
            
        }
        tableView.tableHeaderView = UIView(frame:CGRect(x:0,y:0,width:IAW_ScreenW,height:0.01))
        if tableView.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            tableView.separatorInset = UIEdgeInsets.zero
        }
        if tableView.responds(to: #selector(setter: UIView.layoutMargins)) {
            tableView.layoutMargins = UIEdgeInsets.zero
        }
        
        let enterOrderBtn_Main = UIButton()
        enterOrderBtn_Main.backgroundColor = self.navigationController?.navigationBar.barTintColor
        enterOrderBtn_Main.setTitleColor(UIColor.white, for: UIControl.State())
        enterOrderBtn_Main.layer.cornerRadius = 10
        enterOrderBtn_Main.titleLabel?.font = UIFont.systemFont(ofSize: IAW_PX(px: 30))
        enterOrderBtn_Main.setTitle("确定", for: UIControl.State())
        enterOrderBtn_Main.addTarget(self, action: #selector(enterSubmit), for: .touchUpInside)
        self.view.addSubview(enterOrderBtn_Main)
        enterOrderBtn_Main.snp.makeConstraints{
            (make) in
            make.top.equalTo(tableView.snp.bottom).offset(IAW_PX(px: 100))
            make.left.equalTo(self.view).offset(IAW_LeftMargin)
            make.width.equalTo(IAW_ScreenW-IAW_LeftMargin*2)
            make.height.equalTo(IAW_PX(px: 96))
        }
        
        
    }
    @objc func enterSubmit(){
        
        if selectedIndex == nil{
            _ = self.navigationController?.popViewController(animated: true)
            return
        }
        var value:(String,String) = ("","")
        
        
        
        value = (Array(commonDict.keys)[(selectedIndex?.row)!],"\(Array(commonDict.values)[(selectedIndex?.row)!])")
        
        
        if editValue == value{
            _ = self.navigationController?.popViewController(animated: true)
            return
        }
        delegate?.editClick(editKey: editKey,editValue:value)
    }
    
    func selected() -> UIImageView {
        let mSelected = UIImageView()
        mSelected.image = UIImage(named:"select")
        mSelected.height = IAW_PX(px: 40)
        mSelected.width = IAW_PX(px: 40)
        mSelected.isUserInteractionEnabled = false
        return mSelected
    }
    func noSelected()->UIImageView{
        let mSelected = UIImageView()
        mSelected.image = UIImage(named:"unselect")
        mSelected.height = IAW_PX(px: 40)
        mSelected.width = IAW_PX(px: 40)
        mSelected.isUserInteractionEnabled = false
        return mSelected
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension IAW_SelectListVC: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = commonDict.count
        return count
    }
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // 让分割线靠左封闭
        if cell.responds(to: #selector(setter: UIView.layoutMargins)) {
            cell.layoutMargins = UIEdgeInsets.zero
        }
        if cell.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            cell.separatorInset = UIEdgeInsets.zero
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
            cell!.selectionStyle = .none
        }
        
        cell!.textLabel?.textColor = UIColor.black
        cell!.textLabel?.font = UIFont.systemFont(ofSize: IAW_PX(px: 24))
        let m = noSelected()
        cell?.addSubview(m)
      
        let dataKey = Array(commonDict.keys)[(indexPath as NSIndexPath).row]
        let dataValue = Array(commonDict.values)[(indexPath as NSIndexPath).row]
        cell?.textLabel?.text = dataKey
        m.tag = Int("\(dataValue)")!
        if  "\((dataKey))" == editValue.0{
            selectedIndex = indexPath
        }
        m.snp.makeConstraints{
            (make) in
            make.centerY.equalTo(cell!)
            make.width.height.equalTo(IAW_PX(px: 48))
            make.right.equalTo(cell!).offset(-15)
        }
        
        if(editValue.0 == "" && (indexPath as NSIndexPath).row == 0){
            selectedIndex = indexPath
        }
        
        
        //当上下拉动的时候因为cell的复用性,我们需要重新判断哪一行是否打钩
        if(selectedIndex == indexPath){
            //            cell.accessoryType = .checkmark
            m.image = UIImage(named:"select")
        }else{
            //            cell.accessoryType = .none
            m.image = UIImage(named:"unselect")
        }
        cell?.accessoryView?.isUserInteractionEnabled = false
        return cell!
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //之前选中的，取消选择
        let celled:UITableViewCell = tableView.cellForRow(at: selectedIndex!)!
        
        let dataValue_selected = Array(commonDict.values)[(selectedIndex?.row)!]
        if let m = celled.viewWithTag(Int("\(dataValue_selected)")!) as? UIImageView {
            m.image = UIImage(named:"unselect")
        }
        
        let cell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedIndex = indexPath;
        let dataValue = Array(commonDict.values)[(indexPath as NSIndexPath).row]
        if let m = cell.viewWithTag(Int("\(dataValue)")!) as? UIImageView {
            m.image = UIImage(named:"select")
        }
      
        
        
    }
    
}

