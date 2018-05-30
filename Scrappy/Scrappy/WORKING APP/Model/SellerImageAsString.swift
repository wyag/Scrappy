//
//  SellerImageAsString.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/29/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class SellerImageAsString {
    var sellerImageAsString: String
    
    init?(withDictionary dictionary: [String: Any]) {
        guard let imageString = dictionary["profileImage"] as? String else { return nil }
        
        self.sellerImageAsString = imageString
    }
}
