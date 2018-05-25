//
//  FactsFeedNetworkingHandler.swift
//  Facts
//
//  Created by Nafisa Rahman on 5/25/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import Foundation

class FactsFeedNetworkingHandler {
    
    //MARK:- get JSON response from API
    func getFeedResponse(completion: @escaping (FactsFeedModel) -> Void){
        
        let endPoint = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        
        if let urlRequest = getURL(urlString: endPoint) {
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: urlRequest , completionHandler: {[weak self]  (data, response, error) in
                
                if let weakSelf = self {
                    
                    guard let _:URLResponse = response  , error == nil else {
                        return
                    }
                    
                    guard let responseData = data else {
                        print("Error: did not receive  data")
                        return
                    }
                    
                    //response status is 200
                    let response = response as? HTTPURLResponse
                    if response?.statusCode == 200{
                        
                        //call function to parse received JSON data
                        var factsFeedModel = FactsFeedModel(title: "", rows: [])
                        
                        if let factsdata = weakSelf.parseJSONData(jsonData: responseData) {
                            factsFeedModel  = factsdata
                        }
                        
                        completion(factsFeedModel)
                    }
                    
                } //weak self
                
            })
            
            task.resume()
        
        }
    }
    
    //MARK:- get URL request
    func getURL(urlString : String) -> URLRequest? {
        
        guard let url = URL(string: urlString) else {
            print("can't create URL")
            return nil
        }
        
        let urlRequest = URLRequest(url: url)
        
        return urlRequest
    }
    
    
    //MARK: parse JSON data received and add to data structure
    func parseJSONData(jsonData : Data) -> FactsFeedModel?{
        
        do {
            
            let responseData = try JSONDecoder().decode(FactsFeedModel.self, from: jsonData)
            
            return responseData
            
        } catch {
            print("feed JSON parsing error")
        }
        
        return nil
        
    }
}
