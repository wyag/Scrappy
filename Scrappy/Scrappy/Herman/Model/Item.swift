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
    var description: String?
    var image: String
    var price: String
    
    init?(withDictionary dictionary: [String: Any]) {
        guard let title = dictionary["title"] as? String, let description = dictionary["description"] as? String, let image = dictionary["image"] as? String, let price = dictionary["price"] as? String else { return nil }
        
        self.title = title
        self.description = description
        self.image = image
        self.price = price
    }
    
    init(withTitle title: String, description: String, image: String, price: String) {
        self.title = title
        self.description = description
        self.image = image
        self.price = price 
    }
}
