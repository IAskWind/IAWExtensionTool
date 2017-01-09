# IAWExtensionTool

[![CI Status](http://img.shields.io/travis/IAsk风/IAWExtensionTool.svg?style=flat)](https://travis-ci.org/IAsk风/IAWExtensionTool)
[![Version](https://img.shields.io/cocoapods/v/IAWExtensionTool.svg?style=flat)](http://cocoapods.org/pods/IAWExtensionTool)
[![License](https://img.shields.io/cocoapods/l/IAWExtensionTool.svg?style=flat)](http://cocoapods.org/pods/IAWExtensionTool)
[![Platform](https://img.shields.io/cocoapods/p/IAWExtensionTool.svg?style=flat)](http://cocoapods.org/pods/IAWExtensionTool)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

IAWExtensionTool is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "IAWExtensionTool"
```
### 权限 网络请求 相册 照相机
![权限图](./权限.png =500x300)
### 实例 评分控件 RatingBar https://github.com/IAskWind/RatingBar
		  func dealCommonRatingBar(_ dealView:UIView,title:String,ratingBarTag:Int){
        dealView.width = SCREENW
        
        dealView.backgroundColor = UIColor.white
        let styleLabel = setupLabel(title)
        dealView.addSubview(styleLabel)
        styleLabel.snp.makeConstraints{
            (make) in
            make.top.equalTo(dealView)
            make.left.equalTo(10)
            make.height.equalTo(labelHeight)
            make.width.equalTo(80)
        }

        
        let ratingBar = RatingBar()
        ratingBar.frame = CGRect(x: 0, y: 0, width: 100, height:50)
        ratingBar.setSeletedState("star_big1", halfSelectedName: "star_big2", fullSelectedName: "star_big3", starSideLength: 35, delegate: self)
        ratingBar.displayRating(0)
        ratingBar.isIndicator = false
        ratingBar.supportHalfStar = false
        ratingBar.tag = ratingBarTag
        dealView.addSubview(ratingBar)
        ratingBar.snp.makeConstraints{
            (make) in
            make.top.equalTo(styleLabel.snp.bottom)
            make.centerX.equalTo(dealView)
            make.width.equalTo(ratingBar.width)
            make.height.equalTo(50)
        }
        dealView.height = 100
        

        
    }

### 实例 图片截取 https://github.com/sprint84/PhotoCropEditor
	继承 UINavigationControllerDelegate, UIImagePickerControllerDelegate, CropViewControllerDelegate
	
	
	func cropImg(img:UIImage){
        let controller = CropViewController()
        controller.delegate = self
        controller.image = img
        
        let navController = UINavigationController(rootViewController: controller)
        present(navController, animated: true, completion: nil)
    
    }
    
     // MARK: - CropView
    func cropViewController(_ controller: CropViewController, didFinishCroppingImage image: UIImage) {
        print("12323")
        //        controller.dismissViewControllerAnimated(true, completion: nil)
        //        imageView.image = image
        //        updateEditButtonEnabled()
    }
    
    func cropViewController(_ controller: CropViewController, didFinishCroppingImage image: UIImage, transform: CGAffineTransform, cropRect: CGRect) {
        controller.dismiss(animated: true, completion: nil)
        uploadImg.tag = 1
	//   image.imageOrientation = .right
        
           uploadImg.image = image
        // 照片处理好，显示图层
       
	//        updateEditButtonEnabled()
    }
    
    func cropViewControllerDidCancel(_ controller: CropViewController) {
        controller.dismiss(animated: true, completion: nil)
	//        updateEditButtonEnabled()
        print("取消")
        resetUIAndToMain()
    }
    
    // MARK: - UIImagePickerController delegate methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            dismiss(animated: true, completion: nil)
            return
        }
	//        uploadImg.image = image
	//        cropImg(img: image)
        
        dismiss(animated: true) { [unowned self] in
	//            self.openEditor(nil)
	//            self.uploadImgClick(nil)
            self.cropImg(img: image)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
         self.dismiss(animated: true, completion: nil)
        resetUIAndToMain()
    }



## Author

IAskWind, iaskwind@foxmail.com

## License

IAWExtensionTool is available under the MIT license. See the LICENSE file for more info.
