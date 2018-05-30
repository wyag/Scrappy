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
    var image: UIImage
    var price: Int
    var sellerName: String
    var sellerProfImage: UIImage?
    var sellerUID: String
    
    init?(withDictionary itemDictionary: [String: Any]) {
        guard let title = itemDictionary["title"] as? String, let description = itemDictionary["description"] as? String, let imageString = itemDictionary["image"] as? String, let price = itemDictionary["price"] as? Int, let sellerName = itemDictionary["sellerName"] as? String, let sellerImageString = itemDictionary["sellerProfImage"] as? String, let sellerUID = itemDictionary["sellerUID"] as? String else { return nil }
        
        guard let itemImageURL = URL(string: imageString), let sellerImageURL = URL(string: sellerImageString)  else { return nil }
        guard let itemImageData = try? Data(contentsOf: itemImageURL), let sellerImageData = try? Data(contentsOf: sellerImageURL) else { return nil }
        guard let itemImage = UIImage(data: itemImageData), let sellerImage = UIImage(data: sellerImageData) else { return nil }
        
        self.title = title
        self.description = description
        self.image = itemImage
        self.price = price
        self.sellerName = sellerName
        self.sellerProfImage = sellerImage
        self.sellerUID = sellerUID
    }
    
    init(withTitle title: String, description: String, image: UIImage, price: Int, sellerName: String = "title", sellerProfImage: UIImage? = #imageLiteral(resourceName: "xMark"), sellerUID: String = "SOMETHING") {
        
        self.title = title
        self.description = description
        self.image = image
        self.price = price
        self.sellerName = sellerUID
        self.sellerProfImage = sellerProfImage
        self.sellerUID = sellerUID
    }
}







