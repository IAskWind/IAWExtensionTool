//
//  IAW_WebViewTool.swift
//  IAWExtensionTool
//
//  Created by winston on 17/1/6.
//  Copyright © 2017年 winston. All rights reserved.
//

import Foundation
import ObjectMapper
open class IAW_WebViewTool{
    
    open class func webViewLoadUrl(webView:UIWebView,urlStr:String) {
        let accessToken = UserDefaults.standard.string(forKey:IAW_AccessToken) != nil ? UserDefaults.standard.string(forKey: IAW_AccessToken)! : "";
        webView.iawLoadUrlByHeader(url: urlStr, headers: [accessToken : IAW_AccessToken])
    }
    
    open class func webViewDealValidateToken(webView:UIWebView){
        webView.isHidden = true
        let str = webView.iawGetContentStr()
        if let msgModel = Mapper<IAW_ResponseMsgModel>().map(JSONString: str!){
            //
            if IAW_TokenTool.tokenDeal(tokenInvalid: msgModel.tokenInvalid){
                IAW_ProgressHUDTool.showErrorInfo(msg: msgModel.msg)
                return
            }
            //            if WBNetworkTool.shareNetworkTool.vipDeal(vipInvalid: msgModel.vipInvalid,msg: msgModel.msg){
            //                return
            //            }
        }
        
        
        webView.isHidden = false
    }

    open class func webViewNoTokenLoadUrl(webView:UIWebView,urlStr:String) {
        //处理中文参数，报错的问题，进行url编码
        let urlS = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        print(urlS as Any)
        let request = URLRequest(url: URL(string: urlS!)!)
        //        request.addValue(UserDefaults.standard.string(forKey: accessToken) != nil ? UserDefaults.standard.string(forKey: accessToken)! : "", forHTTPHeaderField: "accesstoken")
        webView.loadRequest(request)
        
    }

}
