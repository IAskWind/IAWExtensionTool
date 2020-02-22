//
//  UITableView+Extension.swift
//  CtkApp
//
//  Created by winston on 16/12/9.
//  Copyright © 2016年 winston. All rights reserved.
//

import UIKit
import SnapKit
extension UITableView {
    /// 当数据为 0 或加载数据失败的时候显示
    open func tableViewNoDataOrNewworkFail(_ rowCount: Int) {
        if rowCount == 0 {
            let bgView = UIView()
            bgView.frame = self.frame
            let imgView = UIImageView()
            imgView.image = IAW_ImgXcassetsTool.not_network_loading_226x119.image
            imgView.contentMode = .center
            let titleLable = UILabel()
            titleLable.textColor = UIColor.iaw_Color(0, g: 0, b: 0, a: 0.6)
            titleLable.font = UIFont.systemFont(ofSize: 16)
            titleLable.text = "没有找到数据!"
            //            titleLable.backgroundColor = UIColor.red
            //            titleLable.backgroundColor = UIColor.redColor()
            titleLable.sizeToFit()
            //            titleLable.contentMode = .center
            imgView.addSubview(titleLable)
            bgView.addSubview(imgView)
            imgView.snp.makeConstraints{
                (make) in
                make.centerX.equalTo(bgView)
                make.centerY.equalTo(bgView).offset(-50)
            }
            
            titleLable.snp.makeConstraints{
                (make) in
                make.centerX.equalTo(bgView)
                make.bottom.equalTo(imgView.snp.top)
            }
            //            titleLable.snp_makeConstraints{
            //                (make) in
            //                    make.centerX.equalTo(imgView.centerX)
            //                    make.centerY.equalTo(imgView.centerY).offset(40)
            //            }
            backgroundView = bgView
            separatorStyle = .none
            //            self.mj_footer?.isHidden = true
        } else {
            backgroundView = nil
            separatorStyle = .singleLine
            //            self.mj_footer?.isHidden = false
        }
    }
}
