//
//  IAWWebView.swift
//  IAWExtensionTool
//
//  Created by winston on 16/11/16.
//  Copyright © 2016年 winston. All rights reserved.
//

import Foundation
import UIKit
extension UIWebView {
    
    open func iawLoadUrl(url:String){
        //处理中文参数，报错的问题，进行url编码
        let urlStr = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let request = URLRequest(url: URL(string: urlStr!)!)
        self.loadRequest(request)
    }
    // 带header的数据
    open func iawLoadUrlByHeader(url:String,headers:[String:String]){
        //处理中文参数，报错的问题，进行url编码
        let urlStr = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        var request = URLRequest(url: URL(string: urlStr!)!)
        for header in headers{
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        self.loadRequest(request)
        
    }
    //获取webView返回内容
    open func iawGetContentStr()->String?{
        return self.stringByEvaluatingJavaScript(from: "document.body.innerText")
    }
    
}
