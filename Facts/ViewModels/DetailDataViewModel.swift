//
//  DetailDataViewModel.swift
//  Facts
//
//  Created by Nafisa Rahman on 5/25/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import Foundation

class DetailDataViewModel {
    
    //MARK:- declarations
    fileprivate var detailDataModel : DetailDataModel
    weak var delegate : UpdateDetailData?
    
    init() {
       detailDataModel = DetailDataModel(rowTitle: "", rowImgHref: "", rowDescription: "")
    }
    
    //MARK:- get rowTitle
    func getRowTitle() -> String {
        return detailDataModel.rowTitle
    }
    
    //MARK:- set rowTitle
    func setRowTitle(title: String) {
        detailDataModel.rowTitle = title
        delegate?.updateDetailTitle()
    }
    
    //MARK:- get rowImgHref
    func getRowImgHref() -> String {
        return detailDataModel.rowImgHref
    }
    
    //MARK:- set rowImgHref
    func setRowImgHref(link: String) {
        detailDataModel.rowImgHref = link
        delegate?.updateDetailImg()
    }
    
    //MARK:- get rowDescription
    func getRowDescription() -> String {
        return detailDataModel.rowDescription
    }
    
    //MARK:- set rowDescription
    func setRowDescription(desc: String) {
        detailDataModel.rowDescription = desc
        delegate?.updateDetailDesc()
    }
     
}
