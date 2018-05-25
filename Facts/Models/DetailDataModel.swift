//
//  DetailDataModel.swift
//  Facts
//
//  Created by Nafisa Rahman on 5/25/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import Foundation

//MARK:- data model for detailed screen

struct DetailDataModel {
    
    var rowTitle: String
    var rowImgHref : String
    var rowDescription : String
    
    init(rowTitle: String,rowImgHref: String,rowDescription: String) {
        self.rowTitle = rowTitle
        self.rowImgHref = rowImgHref
        self.rowDescription = rowDescription
    }
}
