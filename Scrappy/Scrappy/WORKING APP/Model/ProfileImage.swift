//
//  ProfileImage.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/27/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class ProfileImage {
    var image: UIImage
    
    init(image: UIImage) {
        self.image = image
    }
    
    init?(withDictionary dictionary: [String: Any]) {
        guard let imageString = dictionary["profileImage"] as? String else { return nil }
        guard let imageURL = URL(string: imageString) else { return nil }
        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
        guard let image = UIImage(data: imageData) else { return nil }
        
        self.image = image
    }
}
