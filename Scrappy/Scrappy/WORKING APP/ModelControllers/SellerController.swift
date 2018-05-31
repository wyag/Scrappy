//
//  SellerController.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/31/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import Firebase

class SellerController {
    
    static let shared = SellerController()
    var seller = Seller(name: "", image: #imageLiteral(resourceName: "xMark"))
    
    func fetchSellerInfo(uid: String, completion: @escaping(Seller?) -> Void) {
        Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            
            guard let imageString = dictionary["profileImage"] as? String else { completion(nil); return }
            guard let name = dictionary["username"] as? String else { completion(nil); return }
            guard let imageURL = URL(string: imageString), let imageData = try? Data(contentsOf: imageURL), let image = UIImage(data: imageData) else { completion(nil); return }
            
            let seller = Seller(name: name, image: image)
            seller.name = name
            seller.image = image
            completion(seller); return
     
        
        }
    }
}
