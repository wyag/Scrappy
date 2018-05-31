//
//  ItemController.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/21/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import Foundation

import UIKit
import Firebase

class ItemController {
    
    static let shared = ItemController()
    
    var profileImage: UIImage?
    var profileName: String?
    var userSellingItems = [UserSellingItem]()
    var allSellingItems = [Item]()
    var userCartItems = [Item]()
    var userPurchasedItems = [Item]()
    
    // MARK: - GET Current User's Data
    func fetchUserData() {
        
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        
        Database.database().reference().child("users/\(currentUserUID)").observeSingleEvent(of: .value) { (snapshot) in
            
            guard let dictionaryValues = snapshot.value as? [String: Any] else { return }
            guard let profImage = ProfileImage(withDictionary: dictionaryValues) else { return }
            guard let username = ProfileName(withDictionary: dictionaryValues) else { return }
            self.profileImage = profImage.image
            self.profileName = username.name
            
            guard let userSellingItem = dictionaryValues["userSellingItems"] as? [String: Any] else { return }
            userSellingItem.forEach({ (key, value) in
                guard let sellingItemDictionary = value as? [String: Any] else { return }
                guard let item = UserSellingItem(withDictionary: sellingItemDictionary) else { return }
                self.userSellingItems.append(item)
            })
            
            guard let cartItems = dictionaryValues["cartItems"] as? [String: Any] else { return }
            cartItems.forEach({ (key, value) in
                guard let cartItemsDictionary = value as? [String: Any] else { return }
                guard let item = Item(withDictionary: cartItemsDictionary) else { return }
                self.userCartItems.append(item)
            })
            
        }
    }
    
    // MARK: - POST Profile Image
    func addProfileImage(image: UIImage) {
        
        self.profileImage = image
        guard let currentUID = Auth.auth().currentUser?.uid else { return }
        
        guard let uploadData = UIImageJPEGRepresentation(image, 0.3) else { return }
        let imageID = UUID().uuidString
        
        Storage.storage().reference().child("profileImages").child(imageID).putData(uploadData, metadata: nil) { (metadata, error) in
            
            if let error = error {
                print("Error saving profile image into storage", error)
            }
            
            guard let imageURL = metadata?.downloadURL()?.absoluteString else { return }
            
            let values = ["profileImage": imageURL] as [String: Any]
            Database.database().reference().child("users").child(currentUID).updateChildValues(values, withCompletionBlock: { (error, _) in
                
                if let error = error {
                    print("Error saving image into db", error)
                }
            })
        }
    }
    
    // MARK: - GET User's Selling Items
    func addUserSellingItems(item: UserSellingItem) {
        
        self.userSellingItems.append(item)
        
        guard let currentUID = Auth.auth().currentUser?.uid else { return }
        
        guard let uploadData = UIImageJPEGRepresentation(item.image, 0.3) else { return }
        let imageID = UUID().uuidString
        
        Storage.storage().reference().child("images").child(imageID).putData(uploadData, metadata: nil) { (metadata, error) in
            
            if let error = error {
                print("error occured during storage putData", error)
            }
            
            guard let image = metadata?.downloadURL()?.absoluteString else { return }

            let dictionaryValue = ["title": item.title, "description": item.description, "image": image, "price": item.price,"sellerUID": currentUID] as [String: Any]
            
            Database.database().reference().child("users").child(currentUID).child("userSellingItems").childByAutoId().updateChildValues(dictionaryValue, withCompletionBlock: { (error, _) in
                if let error = error {
                    print("Error saving values to db", error)
                }
            })
        }
    }
    
    // MARK: - POST All Selling Items
    // FIXME: - Adding an item does not add seller's image to DB. *Check when user FETCH profile image
    func addAllSellingItems(item: Item) {
        
        self.allSellingItems.append(item)

        guard let uploadData = UIImageJPEGRepresentation(item.image, 0.3) else { return }
        let imageID = UUID().uuidString
        
        Storage.storage().reference().child("images").child(imageID).putData(uploadData, metadata: nil) { (metadata, error) in
            
            if let error = error {
                print("Error saving to storage", error)
            }
            
            guard let image = metadata?.downloadURL()?.absoluteString else { return }
            
            guard let currentUID = Auth.auth().currentUser?.uid else { return }
            
            let dictionaryValues = ["title": item.title, "description": item.description, "image": image, "price": item.price, "sellerUID": currentUID] as [String: Any]
            
            Database.database().reference().child("allSellingItems").childByAutoId().updateChildValues(dictionaryValues) { (error, reference) in
                
                if let error = error {
                    print("Error saving dictionary into db", error)
                }
                
                print("Successfully saved all selling items into db")
            }
        }
    }
    
    // MARK: - POST User Cart Items
    func addUserCartItems(item: Item) {
        
        self.userCartItems.append(item)
        
        guard let currentUID = Auth.auth().currentUser?.uid else { return }
        guard let uploadData = UIImageJPEGRepresentation(item.image, 0.3) else { return }
        let imageID = UUID().uuidString
        
        Storage.storage().reference().child("images").child(imageID).putData(uploadData, metadata: nil) { (metadata, error) in
            if let error = error {
                print("Error saving to storage", error)
            }
            
            guard let image = metadata?.downloadURL()?.absoluteString else { return }
            
            let dictionaryValues = ["title": item.title, "description": item.description, "image": image, "price": item.price, "sellerUID": currentUID] as [String: Any]
            Database.database().reference().child("users").child(currentUID).child("cartItems").childByAutoId().updateChildValues(dictionaryValues, withCompletionBlock: { (error, _) in
                if let error = error {
                    print("Error saving cart items to db", error)
                }
            })
        }
        
        print("User cart item added", ItemController.shared.userCartItems.count)
    }
    
    func fetchAllSellingItems(completion: @escaping([Item]?) -> (Void)) {
        
        Database.database().reference().child("allSellingItems").observeSingleEvent(of: .value) { (snapshot) in
            
            guard let dictionaryValues = snapshot.value as? [String: Any] else {
                completion(nil)
                return
            }
            var items = [Item]()
            dictionaryValues.forEach({ (key, value) in
                guard let itemDictionary = value as? [String: Any] else { return }
                guard let item = Item(withDictionary: itemDictionary) else { return }
                items.append(item)
            })
            
            completion(items)
            return
        }
    }
    
    func fetchUserDataWoo(completion: @escaping([UserSellingItem]?, [Item]?, UIImage, String) -> Void) {
        
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        
        Database.database().reference().child("users/\(currentUserUID)").observeSingleEvent(of: .value) { (snapshot) in
            
            guard let dictionaryValues = snapshot.value as? [String: Any] else { return }
            guard let profImage = ProfileImage(withDictionary: dictionaryValues) else { return }
            guard let username = ProfileName(withDictionary: dictionaryValues) else { return }
            self.profileImage = profImage.image
            self.profileName = username.name
            
            guard let userSellingItem = dictionaryValues["userSellingItems"] as? [String: Any] else {
                completion(nil, nil, profImage.image, username.name); return
            }
            
            var fetchedUserSellingItems = [UserSellingItem]()
            userSellingItem.forEach({ (key, value) in
                
                guard let sellingItemDictionary = value as? [String: Any] else {
                    completion(nil, nil, profImage.image, username.name); return
                }
                guard let item = UserSellingItem(withDictionary: sellingItemDictionary) else {
                    completion(nil, nil, profImage.image, username.name); return
                }
                fetchedUserSellingItems.append(item)
                
            })
            
            guard let cartItems = dictionaryValues["cartItems"] as? [String: Any] else {
                completion(nil, nil, profImage.image, username.name); return
            }
            
            var fetchedCartItems = [Item]()
            cartItems.forEach({ (key, value) in
                guard let cartItemsDictionary = value as? [String: Any] else { completion(nil, nil, profImage.image, username.name); return }
                guard let item = Item(withDictionary: cartItemsDictionary) else { completion(nil, nil, profImage.image, username.name); return }
                fetchedCartItems.append(item)
            })
            
            completion(fetchedUserSellingItems, fetchedCartItems, profImage.image, username.name); return
        }
    }
}










