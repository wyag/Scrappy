//
//  ProfileName.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/28/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class ProfileName {
    var name: String
    
    init?(withDictionary dictionary: [String: Any]) {
        guard let name = dictionary["username"] as? String else { return nil }
        
        self.name = name
    }
}
