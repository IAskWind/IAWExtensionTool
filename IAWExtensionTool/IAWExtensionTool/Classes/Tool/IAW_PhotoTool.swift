//
//  IAW_ImageTool.swift
//  IAWExtensionTool
//
//  Created by winston on 17/1/5.
//  Copyright © 2017年 winston. All rights reserved.
//

import Foundation
import SKPhotoBrowser
open class IAW_PhotoTool{
    
    /**
     *利用 https://github.com/suzuki-0000/SKPhotoBrowser 做个简单的图片预览工具
     *any的类型可以 UIImage、[UIImage]、
     */
    open class func show(_ target: UIViewController,any:Any){
        weak var weakSelf = target
        var images = [SKPhoto]()
        if let photoImg = any as? UIImage{
            let photo = SKPhoto.photoWithImage(photoImg)// add some UIImage
            images.append(photo)
        }else if let photoStr = any as? String{
            let photo = SKPhoto.photoWithImageURL(photoStr)
            photo.shouldCachePhotoURLImage = true // you can use image cache by true(NSCache)
            images.append(photo)
        }else if let photoImgs = any as? [UIImage]{
            for photoImg in photoImgs{
                let photo = SKPhoto.photoWithImage(photoImg)// add some UIImage
                images.append(photo)
            }
        }else if let photoStrs = any as? [String]{
            for photoStr in photoStrs{
                let photo = SKPhoto.photoWithImageURL(photoStr)// add some UIImage
                images.append(photo)
            }
        }else{
            print("传入类型错误")
        }
        // 2. create PhotoBrowser Instance, and present from your viewController.
        SKPhotoBrowserOptions.displayToolbar = false
        let browser = SKPhotoBrowser(photos: images)
        browser.initializePageIndex(0)
        weakSelf?.present(browser, animated: true, completion: {})
    }
    
    /**
      *调用相册拍照功能的弹出框
      */
    open class func showPhotoSheet<T: UIViewController>(_ target:T) where T: UIImagePickerControllerDelegate,T:UINavigationControllerDelegate{
        weak var weakSelf = target
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "拍照", style: .default) { action in
            self.showCamera(weakSelf!)
        }
        actionSheet.addAction(cameraAction)
        let albumAction = UIAlertAction(title: "从相册选择", style: .default) { action in
            self.openPhotoAlbum(weakSelf!)
        }
        actionSheet.addAction(albumAction)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { action in }
        actionSheet.addAction(cancelAction)
        
        weakSelf?.present(actionSheet, animated: true, completion: nil)

    }
    open class func showCamera<T: UIViewController>(_ target:T) where T: UIImagePickerControllerDelegate,T:UINavigationControllerDelegate{
        let controller = UIImagePickerController()
        controller.delegate = target
        controller.sourceType = .camera
        target.present(controller, animated: true, completion: nil)
    }
    
    open class func openPhotoAlbum<T: UIViewController>(_ target:T) where T: UIImagePickerControllerDelegate,T:UINavigationControllerDelegate {
        let controller = UIImagePickerController()
        controller.delegate = target
        controller.sourceType = .photoLibrary
        target.present(controller, animated: true, completion: nil)
    }
}
