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
    
    //MARK:- configure cell
    func configure(rowTitle: String, rowImgLink : String) {
        
        //populate row title label
        self.rowTitleLbl.text = rowTitle
        
        //populate image
        self.rowImgView.getImage(contentMode: .scaleToFill, url: rowImgLink)
    }
}
