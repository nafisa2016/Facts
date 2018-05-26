//
//  FactsFeedViewModel.swift
//  Facts
//
//  Created by Nafisa Rahman on 5/25/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import Foundation

class FactsFeedViewModel {
    
    //MARK:- declarations
    var factsFeedNetworkingHandler: FactsFeedNetworkingHandler
    var factsFeedModel : FactsFeedModel
    
    init(){
        factsFeedNetworkingHandler = FactsFeedNetworkingHandler()
        factsFeedModel = FactsFeedModel(title: "", rows: [])
    }
    
    //MARK:- Get no of sections
    func getNumOfSections() -> Int {
        return 1
    }
    
    //MARK:- Get no of items
    func getNumOfItems() -> Int {
        return factsFeedModel.rows!.count
    }
    
    //MARK:- Get nav bar title
    func getNavBarTitle() -> String {
        return factsFeedModel.title
    }
    
    //MARK:- Get cell title
    func getCellTitle(index: Int) -> String {
        return factsFeedModel.rows![index].title ?? ""
    }
    
    //MARK:- Get cell description
    func getCellDescription(index: Int) -> String {
        return factsFeedModel.rows![index].description ?? ""
    }
    
    //MARK:- Get Cell image href
    func getCellImgHref(index: Int) -> String {
        return factsFeedModel.rows![index].imageHref ?? ""
    }
    
    //MARK:- Get facts feed
    func getFactsFeed(completion: @escaping () -> Void){
        
        factsFeedNetworkingHandler.getFeedResponse { [weak self] (feed) in
            if let weakSelf = self {
                DispatchQueue.main.async {
                    weakSelf.factsFeedModel = weakSelf.filterResult(responseData: feed)
                    
                    completion()
                }
            }
            
        }
    }
    
    //MARK:- filter rows with empty title
    func filterResult(responseData: FactsFeedModel) -> FactsFeedModel  {
        
        var filteredResponse = responseData
        filteredResponse.rows = responseData.rows?.filter { $0.title != nil  }
        return filteredResponse
        
    }
    
}
