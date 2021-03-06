//
//  FactsFeedCollectionViewCell.swift
//  Facts
//
//  Created by Nafisa Rahman on 5/25/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import UIKit

class FactsFeedCollectionViewCell: UICollectionViewCell {
    
    //MARK:- outlets
    @IBOutlet weak var rowImgView: UIImageView!
    @IBOutlet weak var rowTitleLbl: UILabel!
    let imageCache = NSCache<NSString, UIImage>()

    //MARK:- configure cell
    func configure(rowTitle: String, rowImgLink : String) {
        
        //populate row title label
        self.rowTitleLbl.preferredMaxLayoutWidth = 200
        self.rowTitleLbl.text = rowTitle
        
        //populate image
        if !rowImgLink.isEmpty {
            self.rowImgView.getImage(contentMode: .scaleAspectFit, url: rowImgLink)
        }
        
  //NSCache to be implemented later
//        if let cachedImage = imageCache.object(forKey: rowImgLink as NSString) {
//
//        } else {
//            //populate image
//            self.rowImgView.getImage(contentMode: .scaleAspectFit, url: rowImgLink)
////            imageCache.setObject(self.rowImgView.image!, forKey: rowImgLink as NSString)
//        }
        
    }
    
    override func prepareForReuse() {
        rowImgView.image = nil
    }
    
    //MARK:- dynamic layout
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        var size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        
        //if cell width is > than screen width
        if size.width > UIScreen.main.bounds.width {
            var aspectRatio : CGFloat = 1.0
            
            if UIDevice.current.orientation == .portrait {
                aspectRatio = size.width / size.height
            } else if UIDevice.current.orientation == .landscapeLeft  || UIDevice.current.orientation == .landscapeRight{
                aspectRatio = size.height / size.width
            }
            size.width = UIScreen.main.bounds.width  
            
            //size.width = UIScreen.main.bounds.width -  2 * self.layoutMargins.left - 2 * self.layoutMargins.right
            size.height = aspectRatio * size.width
        }
        
        frame.size = size
        layoutAttributes.frame = frame
        
        setNeedsLayout()
        layoutIfNeeded()
        
        return layoutAttributes
    }
    
    
}
