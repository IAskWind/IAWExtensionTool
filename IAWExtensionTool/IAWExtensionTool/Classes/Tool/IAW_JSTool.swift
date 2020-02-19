//
//  IAW_JSTool.swift
//  IAWExtensionTool
//
//  Created by IAskWind on 2017/9/11.
//  Copyright © 2017年 winston. All rights reserved.
//

import Foundation
import UIKit
import JavaScriptCore
open class IAW_JSTool:NSObject{
    
    /**
     *初始化JSContext js掉本地方法 此方法在 webViewDidFinishLoad 中初始化
     *import JavaScriptCore
     *定义需要调用本地的方法的协议：
     * @objc protocol JSObjectMethods: JSExport
     * {
     *   func method1();
     *   func method1(_ name:String,_ pwd:String);
     * }
     *WebView所在的ViewController 需继承自定义上面协议JSObjectMethods
     *如keyedSubscript 字符串为 "appEvent" 对应的html中调用本地方法为 javascript:appEvent.method1()
     *如果页面中有多个参数，swift本地方法的参数都要添加下划线
     *比如 method1(_ name:String,_ pwd:String) 每个参数前都要加类型
     *
     *
     */
    open class func initJSContext(_ target: UIViewController,webView:UIWebView,keyedSubscript:String)->JSContext{
        weak var weakSelf = target
        let jsContext = webView.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") as! JSContext
        
        jsContext.setObject(weakSelf, forKeyedSubscript: keyedSubscript as (NSCopying & NSObjectProtocol)?)
        jsContext.exceptionHandler = { (context,exceptionValue) in
            print("异常信息：\(exceptionValue!)");
        }
        return jsContext
    }
}
