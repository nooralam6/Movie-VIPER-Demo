//
//  Ratings.swift
//  MovieVIPERDemo
//
//  Created by new on 19/06/19.
//  Copyright © 2019 Sunday Mobility. All rights reserved.
//

import Foundation
import RealmSwift

class Ratings : Object, Decodable {
    @objc dynamic var source : String?
    @objc dynamic var value : String?
    
    enum CodingKeys: String, CodingKey {
        
        case source = "Source"
        case value = "Value"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        source = try values.decodeIfPresent(String.self, forKey: .source)
        value = try values.decodeIfPresent(String.self, forKey: .value)
    }
    
}
