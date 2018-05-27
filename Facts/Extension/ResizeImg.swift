//
//  ResizeImg.swift
//  Facts
//
//  Created by Nafisa Rahman on 5/27/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import UIKit

extension UIImage {
    
    func resizeImage() -> UIImage {
        
        var imgWidth =  self.size.width
        var imgHeight = self.size.height
        let aspectRatio = imgWidth / imgHeight
        
        if imgWidth > UIScreen.main.bounds.width {
            imgWidth = UIScreen.main.bounds.width - 100.0
            imgHeight = imgWidth * aspectRatio
        }
        
        let newSize = CGSize(width: imgWidth, height: imgHeight)
        
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
