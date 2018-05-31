//
//  UserController.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/31/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import Firebase

class UserController {
    
    private func fetchUser(uid: String, completion: @escaping(User) -> Void) {
        Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value) { (snapshot) in
            
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            let user = User(uid: uid, dictionary: dictionary)
            completion(user); return
        }
    }
}
