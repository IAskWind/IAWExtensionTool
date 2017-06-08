//
//  IAWArray.swift
//  IAWExtensionTool
//
//  Created by winston on 16/11/16.
//  Copyright © 2016年 winston. All rights reserved.
//

import Foundation
public extension Array where Element: Equatable{
 
    //数组转String 逗号分隔
    func iawArrCommaPartition()->String{
        var str:String = ""
        for arr in self{
            if(self.last == arr){
                str.append("\(arr)")
            }else{
                str.append("\(arr),")
            }
        }
        return str
    }
}

public extension Array{

    //数组拷贝 具体的个数
    func iawArrCopy(count:Int)->[Element]{
        var destsReturn = [Element]()
        for index in 0..<self.count {
            if index >= count{
                break
            }
            destsReturn.append(self[index])
        }
        
        return destsReturn
    }
}
