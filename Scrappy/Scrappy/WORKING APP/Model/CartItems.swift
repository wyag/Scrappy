//
//  CartItems.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/28/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class CartItems {
    var title: String
    var description: String
    var image: UIImage
    var price: Int
    
    init?(withDictionary dictionary: [String: Any]) {
        
        guard let title = dictionary["title"] as? String,
            let description = dictionary["description"] as? String,
            let imageString = dictionary["image"] as? String,
            let price = dictionary["price"] as? Int else { return nil }
        
        guard let imageURL = URL(string: imageString), let imageData = try? Data(contentsOf: imageURL), let image = UIImage(data: imageData) else { return nil }
        
        self.title = title
        self.description = description
        self.image = image
        self.price = price
    }
    
    init(title: String, description: String, image: UIImage, price: Int) {
        self.title = title
        self.description = description
        self.image = image
        self.price = price
    }
}
