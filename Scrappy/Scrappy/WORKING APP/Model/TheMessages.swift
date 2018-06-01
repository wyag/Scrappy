//
//  TheMessages.swift
//  Scrappy
//
//  Created by Herman Kwan on 6/1/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import Firebase

class TheMessages: NSObject {
    
    var fromID: String?
    var text: String?
    var timeStamp: Int?
    var toID: String?
    
    init(withDictionary dictionary: [String: Any]) {
        guard let fromID = dictionary["fromID"] as? String, let text = dictionary["text"] as? String, let timeStamp = dictionary["timeStamp"] as? Int, let toID = dictionary["toID"] as? String else { return }
        
        self.fromID = fromID
        self.text = text
        self.timeStamp = timeStamp
        self.toID = toID
    }
    
    func chatPartnerID() -> String? {
        
        if fromID == Auth.auth().currentUser?.uid {
            return toID
        } else {
            return fromID
        }
    }
}
