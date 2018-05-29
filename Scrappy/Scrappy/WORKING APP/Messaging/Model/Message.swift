//
//  Message.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/29/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import Foundation

class Message: Codable, Equatable {
    
    
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.message == rhs.message
    }
    
    
    // - MARK: Local Properties
    let message: String
    
    
    // - MARK: Local Init
    init(message: String) {
        self.message = message
    }
    
    
    
}
