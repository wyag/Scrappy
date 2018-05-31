//
//  Item.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/16/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import Firebase

struct Item {
    var title: String
    var description: String
    var image: UIImage
    var price: Int
    var sellerUID: String
    
    init?(withDictionary itemDictionary: [String: Any]) {
        guard let title = itemDictionary["title"] as? String, let description = itemDictionary["description"] as? String, let imageString = itemDictionary["image"] as? String, let price = itemDictionary["price"] as? Int, let sellerUID = itemDictionary["sellerUID"] as? String else { return nil }
        
        guard let itemImageURL = URL(string: imageString) else { return nil }
        guard let itemImageData = try? Data(contentsOf: itemImageURL) else { return nil }
        guard let itemImage = UIImage(data: itemImageData) else { return nil }
        
        self.title = title
        self.description = description
        self.image = itemImage
        self.price = price
        self.sellerUID = sellerUID
    }
    
    init(withTitle title: String, description: String, image: UIImage, price: Int, sellerUID: String) {
        
        self.title = title
        self.description = description
        self.image = image
        self.price = price
        self.sellerUID = sellerUID
    }
}







