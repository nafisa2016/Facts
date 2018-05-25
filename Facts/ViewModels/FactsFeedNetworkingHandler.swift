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
                        print(responseData)
                        //call function to parse received JSON data
                       var factsFeedModel = FactsFeedModel(title: "", rows: [])
                        
                        
                        //for testing
                        var str =
                        """
    {
    "title":"About Canada",
    "rows":[
    {
    "title":"Beavers",
    "description":"Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony",
    "imageHref":"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"
    },
    {
    "title":"Flag",
    "description":null,
    "imageHref":"http://images.findicons.com/files/icons/662/world_flag/128/flag_of_canada.png"
    },
    {
    "title":"Transportation",
    "description":"It is a well known fact that polar bears are the main mode of transportation in Canada. They consume far less gas and have the added benefit of being difficult to steal.",
    "imageHref":"http://1.bp.blogspot.com/_VZVOmYVm68Q/SMkzZzkGXKI/AAAAAAAAADQ/U89miaCkcyo/s400/the_golden_compass_still.jpg"
    },
    {
    "title":"Hockey Night in Canada",
    "description":"These Saturday night CBC broadcasts originally aired on radio in 1931. In 1952 they debuted on television and continue to unite (and divide) the nation each week.",
    "imageHref":"http://fyimusic.ca/wp-content/uploads/2008/06/hockey-night-in-canada.thumbnail.jpg"
    },
    {
    "title":"Eh",
    "description":"A chiefly Canadian interrogative utterance, usually expressing surprise or doubt or seeking confirmation.",
    "imageHref":null
    },
    {
    "title":"Housing",
    "description":"Warmer than you might think.",
    "imageHref":"http://icons.iconarchive.com/icons/iconshock/alaska/256/Igloo-icon.png"
    },
    {
    "title":"Public Shame",
    "description":" Sadly it's true.",
    "imageHref":"http://static.guim.co.uk/sys-images/Music/Pix/site_furniture/2007/04/19/avril_lavigne.jpg"
    },
    {
    "title":null,
    "description":null,
    "imageHref":null
    },
    {
    "title":"Space Program",
    "description":"Canada hopes to soon launch a man to the moon.",
    "imageHref":"http://files.turbosquid.com/Preview/Content_2009_07_14__10_25_15/trebucheta.jpgdf3f3bf4-935d-40ff-84b2-6ce718a327a9Larger.jpg"
    },
    {
    "title":"Meese",
    "description":"A moose is a common sight in Canada. Tall and majestic, they represent many of the values which Canadians imagine that they possess. They grow up to 2.7 metres long and can weigh over 700 kg. They swim at 10 km/h. Moose antlers weigh roughly 20 kg. The plural of moose is actually 'meese', despite what most dictionaries, encyclopedias, and experts will tell you.",
    "imageHref":"http://caroldeckerwildlifeartstudio.net/wp-content/uploads/2011/04/IMG_2418%20majestic%20moose%201%20copy%20(Small)-96x96.jpg"
    },
    {
    "title":"Geography",
    "description":"It's really big.",
    "imageHref":null
    },
    {
    "title":"Kittens...",
    "description":"Éare illegal. Cats are fine.",
    "imageHref":"http://www.donegalhimalayans.com/images/That%20fish%20was%20this%20big.jpg"
    },
    {
    "title":"Mounties",
    "description":"They are the law. They are also Canada's foreign espionage service. Subtle.",
    "imageHref":"http://3.bp.blogspot.com/__mokxbTmuJM/RnWuJ6cE9cI/AAAAAAAAATw/6z3m3w9JDiU/s400/019843_31.jpg"
    },
    {
    "title":"Language",
    "description":"Nous parlons tous les langues importants.",
    "imageHref":null
    }
    ]
}

"""
                        
                        let jsonData =  str.data(using: .utf8)!
                        if let factsdata = weakSelf.parseJSONData(jsonData: jsonData) {
                            factsFeedModel  = factsdata
                        }

                        
//                        if let factsdata = weakSelf.parseJSONData(jsonData: responseData) {
//                           factsFeedModel  = factsdata
//                        }
                        
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
            
//            if let _: NSDictionary = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary
//            {
//                //return responseData
//            }
//
//            return nil
            
        } catch {
            print("feed JSON parsing error")
        }
        
        return nil
        
    }
}
