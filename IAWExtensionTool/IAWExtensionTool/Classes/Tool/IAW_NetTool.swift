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
    
    public static var headers = [
        IAW_AccessToken: "\(UserDefaults.standard.string(forKey: IAW_AccessToken) != nil ? UserDefaults.standard.string(forKey: IAW_AccessToken)! : "")"]
    public static var accesstoken=UserDefaults.standard.string(forKey: IAW_AccessToken){
        didSet{
            UserDefaults.standard.setValue(accesstoken, forKey: IAW_AccessToken)
            IAW_NetTool.headers = [
                IAW_AccessToken: "\(accesstoken != nil ? accesstoken! : "")"]
            
        }
        
    }
    //
    //    //处理下拉刷新 下拉加载 分页显示
    //    open class func loadDatasByPage<T:Mappable>(_ url:String,params:[String:Any],tableView:UITableView,_ finished:@escaping (_ pageNum:Int,_ datas:[T])->()){
    //        //        let login_name = "test"
    ////        let url = "\(BASE_URL)api/question/list"
    //
    //        let block:(Int,@escaping(Int)->())->() = {
    //            (pageNum,pageReturn) in
    ////            let params = ["pageNum": pageNum
    ////                ,"name": queryName
    ////                ,"typeName": queryType] as [String : Any]
    //
    //            Alamofire.request(url, method: .post,parameters: params,headers: self.headers).responseObject{
    //                (response:DataResponse<IAW_ResponseModels<T>>) in
    //                self.endRefresh(tableView: tableView)
    //                if let responseData = response.result.value{
    //                    //token处理
    //                    if IAW_TokenTool.tokenDeal(tokenInvalid: responseData.tokenInvalid){
    //                        return
    //                    }
    //                    let success = responseData.success
    //                    guard success == true else {
    //                        IAW_ProgressHUDTool.showErrorInfo(msg: responseData.msg)
    //                        return
    //                    }
    //
    //                    if let data = responseData.data{
    //                        pageReturn(responseData.page!)
    //                        finished(responseData.page!,data)
    //                    }
    //                }
    //            }
    //        }
    //        pageBlock(tableView: tableView, block: block)
    //    }
    
    //****************************泛型运用
    
    public typealias Failure = ()->()
    public typealias SuccessNoData = ()->()
    /// Closure to be executed when progress changes.
    public typealias DealTokenInvalid = (Bool)->Bool
    
    //图片上传(多张)
    open class func uploadImgs<M:IAW_BaseModel<Any>>(_ url:String,method: HTTPMethod = .post,uploadImages:[UIImage],headers: HTTPHeaders? = nil,loadingTip:String = "",userDefinedTip:Bool = false,finished:@escaping (M)->(),failure:Failure? = nil,dealTokenInvalid:DealTokenInvalid? = nil){
        if !checkNet(){
            return
        }
        var task:IAW_TaskTool.Task?
        if !loadingTip.isEmpty{
            task = IAW_TaskTool.delay(1) { //1秒后显示
                IAW_ProgressHUDTool.show(msg:loadingTip)
            }
        }
        let scale:CGFloat = 0.8
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                for (index,uploadImg) in uploadImages.enumerated(){
                    let data = uploadImg.jpegData(compressionQuality: scale)
                    multipartFormData.append(data!, withName:"file", fileName: "file\(index).png", mimeType: "image/*")
                }

        },
            to: url,
            method:.post,
            headers:headers,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseObject{
                        (response:DataResponse<M>) in
                        if !loadingTip.isEmpty{
                            IAW_TaskTool.cancel(task) //速度太快的不显示进度条
                            IAW_ProgressHUDTool.dimiss()
                        }
                        if let model = response.result.value{
                            if dealTokenInvalid?(model.isTokenInvalid()) != nil && (dealTokenInvalid?(model.isTokenInvalid()))!{
                                return
                            }
                            let success = model.isSuccess()
                            guard success else {
                                failure?()
                                IAW_MsgTool.showErrorInfo(msg: model.getMsg())
                                return
                            }
                            if !userDefinedTip{
                                IAW_MsgTool.showSuccessInfo(msg: model.getMsg())
                            }
                            finished(model)
                        }
                        
                    }
                case .failure(let encodingError):
                    IAW_ProgressHUDTool.dimiss()
                    print(encodingError)
                }
        }
        )
    }
    
    //    data 返回msg
    open class func loadDataStr<M:IAW_BaseModel<Any>>(_ url:String,method: HTTPMethod = .post,params: Parameters? = nil,headers: HTTPHeaders? = nil,loadingTip:String = "",userDefinedTip:Bool = false,finished:@escaping (M)->(),failure:Failure? = nil,dealTokenInvalid:DealTokenInvalid? = nil){
        if !checkNet(){
            return
        }
        var task:IAW_TaskTool.Task?
        if !loadingTip.isEmpty{
            task = IAW_TaskTool.delay(1) { //1秒后显示
                IAW_ProgressHUDTool.show(msg:loadingTip)
            }
        }
        
        Alamofire.request(url, method: method, parameters: params,headers:headers).responseObject{
            (response:DataResponse<M>) in
            if !loadingTip.isEmpty{
                IAW_TaskTool.cancel(task) //速度太快的不显示进度条
                IAW_ProgressHUDTool.dimiss()
            }
            if let model = response.result.value{
                if dealTokenInvalid?(model.isTokenInvalid()) != nil && (dealTokenInvalid?(model.isTokenInvalid()))!{
                    return
                }
                let success = model.isSuccess()
                guard success else {
                    failure?()
                    IAW_MsgTool.showErrorInfo(msg: model.getMsg())
                    return
                }
                if !userDefinedTip{
                    IAW_MsgTool.showSuccessInfo(msg: model.getMsg())
                }
                finished(model)
                
            }
        }
        
    }
    
    //返回 T 带 failure
    open class func loadData<T:Mappable,M:IAW_BaseModel<T>>(_ url:String,method: HTTPMethod = .post,params: Parameters? = nil,headers: HTTPHeaders? = nil,loadingTip:String = "",userDefinedTip:Bool = false,finished:@escaping (DataResponse<M>,T)->(),failure:Failure? = nil,successNoData:SuccessNoData? = nil,dealTokenInvalid:DealTokenInvalid? = nil){
        if !checkNet(){
            return
        }
        var task:IAW_TaskTool.Task?
        if !loadingTip.isEmpty{
            task = IAW_TaskTool.delay(1) { //1秒后显示
                IAW_ProgressHUDTool.show(msg:loadingTip)
            }
        }
        
        Alamofire.request(url, method: method, parameters: params,headers: headers).responseObject{
            (response:DataResponse<M>) in
            if !loadingTip.isEmpty{
                IAW_TaskTool.cancel(task) //速度太快的不显示进度条
                IAW_ProgressHUDTool.dimiss()
            }
            
            if let model = response.result.value{
                if dealTokenInvalid?(model.isTokenInvalid()) != nil && (dealTokenInvalid?(model.isTokenInvalid()))!{
                    return
                }
                let success = model.isSuccess()
                guard success else {
                    failure?()
                    IAW_MsgTool.showErrorInfo(msg: model.getMsg())
                    return
                }
                if !userDefinedTip{
                    IAW_MsgTool.showSuccessInfo(msg: model.getMsg())
                }
                if let data = model.getData(){
                    finished(response,data)
                }else{
                    successNoData?()
                }
            }
        }
        
    }
    
    //返回 T 不带failure
    //    open class func loadData<T:Mappable,M:IAW_BaseModel<T>>(_ url:String,method: HTTPMethod = .post,params:[String:Any],loadingTip:String = "",userDefinedTip:Bool = false,finished:@escaping (DataResponse<M>,T)->(),failure:(()->())?,dealTokenInvalid:((Bool)->(Bool))?){
    //        if !checkNet(){
    //            return
    //        }
    //        var task:IAW_TaskTool.Task?
    //        if !loadingTip.isEmpty{
    //            task = IAW_TaskTool.delay(1) { //1秒后显示
    //                IAW_ProgressHUDTool.show(msg:loadingTip)
    //            }
    //        }
    //
    //        Alamofire.request(url, method: method, parameters: params).responseObject{
    //            (response:DataResponse<M>) in
    //            if !loadingTip.isEmpty{
    //                IAW_TaskTool.cancel(task) //速度太快的不显示进度条
    //                IAW_ProgressHUDTool.dimiss()
    //            }
    //
    //            if let model = response.result.value{
    //                if dealTokenInvalid?(model.isTokenInvalid()) != nil && (dealTokenInvalid?(model.isTokenInvalid()))!{
    //                    return
    //                }
    //                let success = model.isSuccess()
    //                guard success else {
    //                    failure?()
    //                    IAW_MsgTool.showErrorInfo(msg: model.getMsg())
    //                    return
    //                }
    //                if !userDefinedTip{
    //                    IAW_MsgTool.showSuccessInfo(msg: model.getMsg())
    //                }
    //                if let data = model.getData(){
    //                    finished(response,data)
    //                }
    //            }
    //        }
    //
    //    }
    
    
    
    //返回[T]
    open class func loadDatas<T:Mappable,M:IAW_BaseModel<T>>(_ url:String,method: HTTPMethod = .post,params: Parameters? = nil,headers: HTTPHeaders? = nil,loadingTip:String = "",userDefinedTip:Bool = false,finished:@escaping (M,[T])->(),failure:Failure? = nil,successNoData:SuccessNoData? = nil,dealTokenInvalid:DealTokenInvalid? = nil){
        if !checkNet(){
            return
        }
        var task:IAW_TaskTool.Task?
        if !loadingTip.isEmpty{
            task = IAW_TaskTool.delay(1) { //1秒后显示
                IAW_ProgressHUDTool.show(msg:loadingTip)
            }
        }
        
        Alamofire.request(url, method: method, parameters: params,headers:headers).responseObject{
            (response:DataResponse<M>) in
            if !loadingTip.isEmpty{
                IAW_TaskTool.cancel(task) //速度太快的不显示进度条
                IAW_ProgressHUDTool.dimiss()
            }
            if let model = response.result.value{
                if dealTokenInvalid?(model.isTokenInvalid()) != nil && (dealTokenInvalid?(model.isTokenInvalid()))!{
                    return
                }
                let success = model.isSuccess()
                guard success else {
                    failure?()
                    IAW_MsgTool.showErrorInfo(msg: model.getMsg())
                    return
                }
                if !userDefinedTip{
                    IAW_MsgTool.showSuccessInfo(msg: model.getMsg())
                }
                if let data = model.getDatas(){
                    
                    finished(model, data)
                }else{
                    successNoData?()
                }
            }
        }
        
    }
    
    //泛型分页请求
    open class func loadDatasByPage<T:Mappable,M:IAW_BaseModel<T>>(_ url:String,method: HTTPMethod = .post,params: Parameters? = nil,headers: HTTPHeaders? = nil,tableView:UITableView,finished:@escaping (_ pageNum:Int,_ datas:[T],M)->(),failure:Failure? = nil,dealTokenInvalid:DealTokenInvalid? = nil){
        if !IAW_NetTool.checkNet(){
            return
        }
        let block:(Int,@escaping(Int)->())->() = {
            (pageNum,pageReturn) in
            var params_new:Parameters?
            if params != nil{
                params_new = params
                params_new!.updateValue(pageNum, forKey: "page")
            }else{
                params_new = ["page":pageNum]
            }
            Alamofire.request(url, method:method,parameters: params_new,headers: headers).responseObject{
                (response:DataResponse<M>) in
                IAW_NetTool.endRefresh(tableView: tableView)
                if let model = response.result.value{
                    if dealTokenInvalid?(model.isTokenInvalid()) != nil && (dealTokenInvalid?(model.isTokenInvalid()))!{
                        return
                    }
                    let success = model.isSuccess()
                    guard success else {
                        failure?()
                        IAW_MsgTool.showErrorInfo(msg: model.getMsg())
                        return
                    }
                    
                    if let data = model.getDatas(){
                        if data.count <= 0 && model.getPage()!>2 {
                            print("没新数据了")
                            return
                        }
                        pageReturn(model.getPage()!)
                        finished(model.getPage()!,data,model)
                    }
                }
            }
        }
        pageBlock(tableView: tableView, block: block)
        
    }
    
    open class func loadDatasByPage<T:Mappable,M:IAW_BaseModel<T>>(_ url:String,method: HTTPMethod = .post,params: Parameters? = nil,headers: HTTPHeaders? = nil,collectionView:UICollectionView,finished:@escaping (_ pageNum:Int,_ datas:[T],M)->(),failure:Failure? = nil,dealTokenInvalid:DealTokenInvalid? = nil){
        if !IAW_NetTool.checkNet(){
            return
        }
        let block:(Int,@escaping(Int)->())->() = {
            (pageNum,pageReturn) in
            var params_new:Parameters?
            if params != nil{
                params_new = params
                params_new!.updateValue(pageNum, forKey: "page")
            }else{
                params_new = ["page":pageNum]
            }
            
            Alamofire.request(url, method:method,parameters: params_new,headers: headers).responseObject{
                (response:DataResponse<M>) in
                IAW_NetTool.endRefresh(collectionView: collectionView)
                if let model = response.result.value{
                    if dealTokenInvalid?(model.isTokenInvalid()) != nil && (dealTokenInvalid?(model.isTokenInvalid()))!{
                        return
                    }
                    let success = model.isSuccess()
                    guard success else {
                        failure?()
                        IAW_MsgTool.showErrorInfo(msg: model.getMsg())
                        return
                    }
                    
                    if let data = model.getDatas(){
                        if data.count <= 0 && model.getPage()!>2 {
                            print("没新数据了")
                            return
                        }
                        pageReturn(model.getPage()!)
                        finished(model.getPage()!,data,model)
                    }
                }
            }
        }
        pageBlock(collectionView: collectionView, block: block)
        
    }
    
    
    
}
//扩展 处理下拉刷新  上拉加载 分页
extension IAW_NetTool{
    
    //处理MJRefresh 终止刷新
    open class func endRefresh(tableView:UITableView){
        if tableView.mj_header?.isRefreshing ?? true{
            tableView.mj_header?.endRefreshing();
        }
  
        if tableView.mj_footer?.isRefreshing ?? true{
            tableView.mj_footer?.endRefreshing()
        }
        
    }
    open class func endRefresh(collectionView:UICollectionView){
        
        if collectionView.mj_header?.isRefreshing ?? false{
            collectionView.mj_header?.endRefreshing();
        }
        
        if collectionView.mj_footer?.isRefreshing ?? false{
            collectionView.mj_footer?.endRefreshing()
        }
    }
    
    
    //利用MJRefresh 分页
    open class func pageBlock(tableView:UITableView,block:@escaping (Int,@escaping(Int)->())->()){
        var page = 1
        let pageR = {
            (pageN:Int) in
            page = pageN
        }
        let blockRefresh = {
            block(1,pageR)
            print("blockRefresh**********************************\(page)")
        }
        let blockAdd = {
            block(page,pageR)
            print("blockAdd**********************************\(page)")
        }
        if tableView.mj_header == nil{
            let header = MJRefreshNormalHeader(refreshingBlock:blockRefresh)
            header.lastUpdatedTimeLabel?.isHidden = true
            header.isAutomaticallyChangeAlpha = true //根据拖拽比例自动切换透
            header.stateLabel?.isHidden = true
            tableView.mj_header = header
        }else{
            tableView.mj_header?.refreshingBlock = blockRefresh
        }
        if tableView.mj_header?.isRefreshing ?? false{
            tableView.mj_header?.endRefreshing()
        }
        tableView.mj_header?.beginRefreshing()
        if tableView.mj_footer == nil{
            let footer = MJRefreshAutoNormalFooter(refreshingBlock: blockAdd)
            footer.stateLabel?.isHidden = true
            footer.isRefreshingTitleHidden = true
            tableView.mj_footer = footer
        }else{
            tableView.mj_footer?.refreshingBlock = blockAdd
        }
    }
    
    open class func pageBlock(collectionView:UICollectionView,block:@escaping (Int,@escaping(Int)->())->()){
        var page = 1
        let pageR = {
            (pageN:Int) in
            page = pageN
        }
        let blockRefresh = {
            block(1,pageR)
            print("blockRefresh**********************************\(page)")
        }
        let blockAdd = {
            block(page,pageR)
            print("blockAdd**********************************\(page)")
        }
        if collectionView.mj_header == nil{
            let header = MJRefreshNormalHeader(refreshingBlock:blockRefresh)
            header.lastUpdatedTimeLabel?.isHidden = true
            header.isAutomaticallyChangeAlpha = true //根据拖拽比例自动切换透
            header.stateLabel?.isHidden = true
            collectionView.mj_header = header
        }else{
            collectionView.mj_header?.refreshingBlock = blockRefresh
        }
        if collectionView.mj_header?.isRefreshing ?? false{
            collectionView.mj_header?.endRefreshing()
        }
        collectionView.mj_header?.beginRefreshing()
        if collectionView.mj_footer == nil{
            let footer = MJRefreshAutoNormalFooter(refreshingBlock: blockAdd)
            footer.stateLabel?.isHidden = true
            footer.isRefreshingTitleHidden = true
            collectionView.mj_footer = footer
        }else{
            collectionView.mj_footer?.refreshingBlock = blockAdd
        }
    }
    
    //检测当前网络是否连接
    open class func checkNet()->Bool{
        let manager = NetworkReachabilityManager()
        let isNet = manager?.isReachable
        print(isNet as Any)
        if !isNet!{
            IAW_MsgTool.showWarningInfo(msg: "请检查您的网络是否连接!",seconds: 3)
        }
        return isNet!
    }
    
    
}
