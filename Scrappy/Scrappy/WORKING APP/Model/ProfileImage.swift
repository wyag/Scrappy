//
//  ProfileImage.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/28/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class ProfileImage {
    var image: UIImage
    
    init?(withDictionary dictionary: [String: Any]) {
        guard let imageString = dictionary["profileImage"] as? String, let imageURL = URL(string: imageString), let imageData = try? Data(contentsOf: imageURL), let profImage = UIImage(data: imageData) else { return nil }
        self.image = profImage
    }
}
