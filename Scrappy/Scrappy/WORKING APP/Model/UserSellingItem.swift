//
//  UserSellingItem.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/30/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

struct UserSellingItem {
    var title: String
    var description: String
    var image: UIImage
    var price: Int
    
    init?(withDictionary itemDictionary: [String: Any]) {
        guard let title = itemDictionary["title"] as? String, let description = itemDictionary["description"] as? String, let imageString = itemDictionary["image"] as? String, let price = itemDictionary["price"] as? Int else { return nil }
        
        guard let itemImageURL = URL(string: imageString) else { return nil }
        guard let itemImageData = try? Data(contentsOf: itemImageURL) else { return nil }
        guard let itemImage = UIImage(data: itemImageData) else { return nil }
        
        self.title = title
        self.description = description
        self.image = itemImage
        self.price = price
    }
    
    init(withTitle title: String, description: String, image: UIImage, price: Int, sellerName: String = "title") {
        
        self.title = title
        self.description = description
        self.image = image
        self.price = price
    }
}
