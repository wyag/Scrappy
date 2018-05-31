//
//  Post.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/31/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import Foundation

struct Post {
    
    var id: String?
    
    let user: User
    let imageURL: String
    let title: String
    let price: Int
    let description: String
    
    init(user: User, dictionary: [String: Any]) {
        self.user = user
        self.imageURL = dictionary["imageURL"] as? String ?? ""
        self.title = dictionary["title"] as? String ?? ""
        self.price = dictionary["price"] as? Int ?? 0
        self.description = dictionary["description"] as? String ?? "" 
    }
}
