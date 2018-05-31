//
//  User.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/31/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

struct User {
    let uid: String
    let userName: String
    let profileImageURL: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.userName = dictionary["userName"] as? String ?? ""
        self.profileImageURL = dictionary["profileImage"] as? String ?? "" 
    }
}
