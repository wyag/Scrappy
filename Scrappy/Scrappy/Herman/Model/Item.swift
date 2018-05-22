//
//  Item.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/16/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

struct Item {
    var title: String
    var description: String
    var photos: [URL]
    var price: Int
    var category: Category
    
    init?(withDictionary dictionary: [String: Any]) {
        guard let title = dictionary["title"] as? String, let description = dictionary["description"] as? String, let photos = dictionary["photos"] as? [URL], let price = dictionary["price"] as? Int, let category = dictionary["category"] as? Category else { return nil }
        
        self.title = title
        self.description = description
        self.photos = photos
        self.price = price
        self.category = category
    }
}
