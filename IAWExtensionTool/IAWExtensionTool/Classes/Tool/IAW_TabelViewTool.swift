//
//  IAW_TabelViewTool.swift
//  IAWExtensionTool
//
//  Created by winston on 17/1/6.
//  Copyright © 2017年 winston. All rights reserved.
// tableview 处理 包裹无数据处理
//

import Foundation
open class IAW_TabelViewTool{
    
    open class func tableViewNoData(tableview:UITableView?,arrays:[Any]?){
        tableview?.tableViewNoDataOrNewworkFail((arrays?.count)!)
    }

}
