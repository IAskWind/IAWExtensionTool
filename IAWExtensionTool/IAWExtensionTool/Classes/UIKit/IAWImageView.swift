//
//  IAWImageView.swift
//  IAWExtensionTool
//
//  Created by winston on 16/11/17.
//  Copyright © 2016年 winston. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

public extension UIImageView {

    func iawCircleHeader(_ url: String,radius:Int){
        if url != "" {
            self.kf.setImage(with: URL(string:url)!, placeholder: IAW_ImgXcassetsTool.headerPhoto.image)
        }else{
            self.image = IAW_ImgXcassetsTool.headerPhoto.image
        }
        self.layer.cornerRadius = CGFloat(radius)
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
        self.layer.masksToBounds = true
    }
    func showView(){
    
    
    }
}
