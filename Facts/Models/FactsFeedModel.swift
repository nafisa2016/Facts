//
//  FactsFeedModel.swift
//  Facts
//
//  Created by Nafisa Rahman on 5/25/18.
//  Copyright © 2018 com.nafisa. All rights reserved.
//

import Foundation

//MARK:- data model for first screen

struct Row : Codable {
    var title : String?
    var description: String?
    var imageHref: String?
    
    enum CodingKeys : String, CodingKey {
        case title
        case description
        case imageHref
    }
    
    init(title: String,description: String,imageHref: String) {
        self.title = title
        self.description = description
        self.imageHref = imageHref
    }
    
//    init(from decoder: Decoder) throws {
//
//        let item = try decoder.container(keyedBy: CodingKeys.self)
//
//        title = try item.decodeIfPresent(String.self,forKey: .title)
//        description = try item.decodeIfPresent(String.self,forKey: .description)
//        imageHref = try item.decodeIfPresent(String.self,forKey: .imageHref)
//    }
}

struct FactsFeedModel : Codable {
    
    var title: String
    var rows : [Row]?
    
    init(title: String,rows: [Row]) {
        self.title = title
        self.rows = rows
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case rows
    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        title = try container.decode(String.self, forKey: .title)
//        rows = try container.decode([Row].self, forKey: .rows)
//    }
    
}






