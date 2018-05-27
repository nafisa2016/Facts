//
//  GetImage.swift
//  Facts
//
//  Created by Nafisa Rahman on 5/25/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func getImage(contentMode: UIViewContentMode,url : String){
        
        guard let imgUrl = URL(string: url) else {
            print("can't create URL")
            return
        }
        
        URLSession.shared.dataTask( with: imgUrl, completionHandler: { [weak self]
            (data, response, error) -> Void in
            
            if let weakSelf = self {
                
                DispatchQueue.main.async {
                    
                    weakSelf.contentMode =  contentMode
                    
                    if let data = data {
                         //weakSelf.image = UIImage(data: data)
                        weakSelf.image = UIImage(data: data)?.resizeImage()
                        weakSelf.layoutIfNeeded()
                        weakSelf.setNeedsLayout()
                    }
                }
                
            }
            
        }).resume()
        
    }
        
}
