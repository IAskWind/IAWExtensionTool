//
//  IAW_NoTokenWebViewController.swift
//  CtkApp
//
//  Created by winston on 16/12/31.
//  Copyright © 2016年 winston. All rights reserved.
//

import UIKit
import SnapKit
open class IAW_NoTokenWebViewController: IAW_BaseViewController {
    
    fileprivate var webView = UIWebView()
    fileprivate var urlStr: String?
    fileprivate let loadProgressAnimationView: LoadProgressAnimationView = LoadProgressAnimationView(bgColor: UIColor.brown,frame: CGRect(x:0, y: 0, width: IAW_ScreenW, height: 3))
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        view.addSubview(webView)
        webView.snp.makeConstraints{
            (make) in
                make.edges.equalTo(self.view)
        }
        webView.addSubview(loadProgressAnimationView)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(urlStr: String) {
        self.init(nibName: nil, bundle: nil)
        // navigationItem.title = navigationTitle
        //        webView.loadRequest(URLRequest(url: URL(string: urlStr)!))
        IAW_WebViewTool.webViewNoTokenLoadUrl(webView: webView, urlStr: urlStr)
        self.urlStr = urlStr
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        buildRightItemBarButton()
        
        //        view.backgroundColor = UIColor.colorWithCustom(230, g: 230, b: 230)
        //        webView.backgroundColor = UIColor.colorWithCustom(230, g: 230, b: 230)
        webView.delegate = self
        //            / 自动对页面进行缩放以适应屏幕
        webView.scalesPageToFit = true
        webView.dataDetectorTypes = .all
        
        webView.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    fileprivate func buildRightItemBarButton() {
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 44))
        rightButton.setImage(UIImage(named: "v2_refreshWhite"), for: UIControl.State())
        rightButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -53)
        rightButton.addTarget(self, action: #selector(refreshClick), for: UIControl.Event.touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
    }
    
    // MARK: - Action
    @objc func refreshClick() {
        if urlStr != nil && urlStr!.count > 1 {
            //            webView.loadRequest(URLRequest(url: URL(string: urlStr!)!))
            IAW_WebViewTool.webViewNoTokenLoadUrl(webView: webView, urlStr: urlStr!)
        }
    }
}

extension IAW_NoTokenWebViewController: UIWebViewDelegate {
    
    public func webViewDidStartLoad(_ webView: UIWebView) {
        loadProgressAnimationView.startLoadProgressAnimation()
    }
    
    public func webViewDidFinishLoad(_ webView: UIWebView) {
        loadProgressAnimationView.endLoadProgressAnimation()
//        IAWCommonFuncTool.common.webViewValidateTokenAndVip(webView: webView)
    }
}

