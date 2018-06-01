//
//  MessageUser.swift
//  Scrappy
//
//  Created by Herman Kwan on 6/1/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class MessageUser {
    var uid: String
    var username: String
    var profileImage: UIImage
    
    init(uid: String, username: String, profileImage: UIImage) {
        self.uid = uid
        self.username = username
        self.profileImage = profileImage
    }
    
    init?(uid: String, withDictionary dictionary: [String: Any]) {
        guard let username = dictionary["username"] as? String, let imageString = dictionary["profileImage"] as? String, let imageURL = URL(string: imageString), let imageData = try? Data(contentsOf: imageURL), let image = UIImage(data: imageData) else { return nil }
        
        self.username = username
        self.profileImage = image
        self.uid = uid
    }
}
