//
//  MessageController.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/29/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import Foundation
import Firebase

class MessageController {
    
    // Global Reference
    static let shared = MessageController()
    
    // S.O.T.
    var messages: [Message]?
    
    // S.O.T. init
    init?() {
        guard let user = Auth.auth().currentUser?.uid else { return }
        Database.database().reference().child("users").child(user).observe(.value, with: { (Snapshot) in
            guard let ms = Snapshot.value as? [String : Any] else { return }
            guard let mArray = ms["messages"] as? [ else { return }
            
        })
    }
    
    // Local Properties
    var dRef: DatabaseReference!
    
    // - MARK: CRUD Functions
    
    // Send Message
    func sendMessage(_ message: Message, _ item: Item) {
        
        guard let user = Auth.auth().currentUser?.uid else { return }
        
        
        dRef = Database.database().reference().child("users").child(user).child("messages").child("Spencer").childByAutoId()
        
        
        
        var messageValues = ["message" : message.message, "owner" : message.owner]
        var messageKey = ["messageKey" : messageValues]
        
        dRef.updateChildValues([messageKey : messageValues], withCompletionBlock: <#T##(Error?, DatabaseReference) -> Void#>)
        
        
    }
    
    
    // - MARK: Fetch Messages
    
    func fetchMessages() {
        
        guard let user = Auth.auth().currentUser?.uid else { return }
        
        // Assign Database Reference & Message Dictionary
        dRef = Database.database().reference().child("users").child(user)
        var messageDictionary: [String : Any]?
        
        
        dRef.updateChildValues(<#T##values: [AnyHashable : Any]##[AnyHashable : Any]#>, withCompletionBlock: <#T##(Error?, DatabaseReference) -> Void#>)
        
        
        
    }
    
    
    
}
