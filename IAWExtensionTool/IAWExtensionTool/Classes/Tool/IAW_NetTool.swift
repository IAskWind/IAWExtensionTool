//
//  IAW_NetTool.swift
//  IAWExtensionTool
//
//  Created by winston on 17/1/6.
//  Copyright © 2017年 winston. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper
import MJRefresh
import Alamofire
open class IAW_NetTool{

    open static var headers = [
        IAW_AccessToken: "\(UserDefaults.standard.string(forKey: IAW_AccessToken) != nil ? UserDefaults.standard.string(forKey: IAW_AccessToken)! : "")"]
    open static var accesstoken=UserDefaults.standard.string(forKey: IAW_AccessToken){
        didSet{
            UserDefaults.standard.setValue(accesstoken, forKey: IAW_AccessToken)
            IAW_NetTool.headers = [
                IAW_AccessToken: "\(accesstoken != nil ? accesstoken! : "")"]
            
        }
        
    }
    //  调用
    //        IAW_NetTool.loginAPP(url, params: params){
    //            (userVo:UserVo) in
    //                print("获得的登录用户名:\(userVo.name)")
    //
    //        }
    
    open class func loginAPP<T:Mappable>(_ url:String,params:[String:Any],finished:@escaping (T)->()){
        IAW_ProgressHUDTool.show(msg: IAW_MsgTip.loginingTip)
//        let url = "\(BASE_URL)api/auth/login"
//        let params = ["userName": userName,
//                      "passwd": pwd]
        let start = Date()
        Alamofire.request(url, method: .post, parameters: params).responseObject{
            (response:DataResponse<IAW_ResponseModel <T>>) in
            let finish = Date()
            print("登录耗时loginAPP**************************************: \(finish.timeIntervalSince(start))")
            IAW_ProgressHUDTool.dimiss()
            print("loginAPP********* in   ")
            if let model = response.result.value{
                let success = model.success
                
                guard success == true else {
                    IAW_ProgressHUDTool.showErrorInfo(msg: model.msg)
                    return
                }
                
                //设置token
                if(success)!{
                    print("登录token:\(model.accessToken!)")
                    self.accesstoken = model.accessToken
                }
                if let data = model.data{
                    finished(data)
                }
            }
        }
    }
    
    //处理下拉刷新 下拉加载 分页显示
    open class func loadDatasByPage<T:Mappable>(_ url:String,params:[String:Any],tableView:UITableView,_ finished:@escaping (_ pageNum:Int,_ datas:[T])->()){
        //        let login_name = "test"
//        let url = "\(BASE_URL)api/question/list"
        
        let block:(Int,@escaping(Int)->())->() = {
            (pageNum,pageReturn) in
//            let params = ["pageNum": pageNum
//                ,"name": queryName
//                ,"typeName": queryType] as [String : Any]
            
            Alamofire.request(url, method: .post,parameters: params,headers: self.headers).responseObject{
                (response:DataResponse<IAW_ResponseModels<T>>) in
                self.endRefresh(tableView: tableView)
                if let responseData = response.result.value{
                    //token处理
                    if IAW_TokenTool.tokenDeal(tokenInvalid: responseData.tokenInvalid){
                        return
                    }
                    let success = responseData.success
                    guard success == true else {
                        IAW_ProgressHUDTool.showErrorInfo(msg: responseData.msg)
                        return
                    }
                    
                    if let data = responseData.data{
                        pageReturn(responseData.page!)
                        finished(responseData.page!,data)
                    }
                }
            }
        }
        pageBlock(tableView: tableView, block: block)
    }

    

}
//扩展 处理下拉刷新  上拉加载 分页
extension IAW_NetTool{

    //处理MJRefresh 终止刷新
    open class func endRefresh(tableView:UITableView){
        if tableView.mj_header.isRefreshing(){
            tableView.mj_header.endRefreshing()
        }
        if tableView.mj_footer.isRefreshing(){
            tableView.mj_footer.endRefreshing()
        }
        
    }
    //利用MJRefresh 分页
    open class func pageBlock(tableView:UITableView,block:@escaping (Int,@escaping(Int)->())->()){
        var page = 1
        let pageR = {
            (pageN:Int) in
            page = pageN
            if let a = tableView.mj_footer as? MJRefreshAutoNormalFooter {
                a.stateLabel.isHidden = true
            }
        }
        let blockRefresh = {
            if let a = tableView.mj_footer as? MJRefreshAutoNormalFooter {
                a.stateLabel.isHidden = true
            }
            block(1,pageR)
            print("blockRefresh**********************************\(page)")
        }
        let blockAdd = {
            if let a = tableView.mj_footer as? MJRefreshAutoNormalFooter{
                a.stateLabel.isHidden = false
            }
            block(page,pageR)
            print("blockAdd**********************************\(page)")
            //            if let a = tableView.mj_footer as? MJRefreshAutoNormalFooter{
            //                a.stateLabel.isHidden = true
            //            }
        }
        if tableView.mj_header == nil{
            let header = MJRefreshNormalHeader(refreshingBlock:blockRefresh)
            header!.lastUpdatedTimeLabel.isHidden = true
            header!.isAutomaticallyChangeAlpha = true //根据拖拽比例自动切换透
            tableView.mj_header = header!
        }else{
            tableView.mj_header.refreshingBlock = blockRefresh
        }
        if tableView.mj_header.isRefreshing(){
            tableView.mj_header.endRefreshing()
        }
        
        
        tableView.mj_header.beginRefreshing()
        
        
        if tableView.mj_footer == nil{
            let footer = MJRefreshAutoNormalFooter(refreshingBlock: blockAdd)
            footer?.stateLabel.isHidden = true
            tableView.mj_footer = footer
        }else{
            tableView.mj_footer.refreshingBlock = blockAdd
        }
        
        
    }
    
    
}
