//
//  Message.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/29/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import Foundation
import Firebase

class Message: Codable, Equatable {
    
    // - MARK: Local Properties
    let message: String
    var owner: String?
    
    
    // - MARK: Local Init
    init(message: String) {
        self.message = message
        self.owner = Auth.auth().currentUser?.uid
    }
    
    // - MARK: Equatable
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.message == rhs.message
    }
    
}
