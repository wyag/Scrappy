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
    var userSellingItems = [Item]()
    var allSellingItems = [Item]()
    var userCartItems = [Item]()
    var userPurchasedItems = [Item]()
    
    func fetchUserData() {
        
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        
        Database.database().reference().child("users").child(currentUserUID).observeSingleEvent(of: .value) { (snapshot) in
            
            guard let dictionaryValues = snapshot.value as? [String: Any] else { return }
            guard let profImage = ProfileImage(withDictionary: dictionaryValues) else { return }
            guard let username = ProfileName(withDictionary: dictionaryValues) else { return }
            self.profileImage = profImage.image
            self.profileName = username.name
            
            guard let cartItem = dictionaryValues["cartItems"] as? [String: Any] else { return }
            cartItem.forEach({ (key, value) in
                guard let cartItemDictionary = value as? [String: Any] else { return }
                guard let item = Item(withDictionary: cartItemDictionary) else { return }
                self.userCartItems.append(item)
            })
            
            guard let userSellingItem = dictionaryValues["userSellingItems"] as? [String: Any] else { return }
            userSellingItem.forEach({ (key, value) in
                guard let sellingItemDictionary = value as? [String: Any] else { return }
                guard let item = Item(withDictionary: sellingItemDictionary) else { return }
                self.userSellingItems.append(item)
            })
            
        }
    }
    
    func fetchAllSellingItems() {
        
        Database.database().reference().child("allSellingItems").observeSingleEvent(of: .value) { (snapshot) in
            
            guard let dictionaryValues = snapshot.value as? [String: Any] else { return }
            
            dictionaryValues.forEach({ (key, value) in
                guard let itemDictionary = value as? [String: Any] else { return }
                guard let item = Item(withDictionary: itemDictionary) else { return }
                self.allSellingItems.append(item)
            })
        }
    }
    
    func fetchProfileImage() {
        
        guard let currentUID = Auth.auth().currentUser?.uid else { return }
        

        Database.database().reference().child("users").child(currentUID).observeSingleEvent(of: .value) { (snapshot) in
            
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            
            guard let profImage = ProfileImage(withDictionary: dictionary) else { return }
            self.profileImage = profImage.image
            
        }
        print("Successfully fetched image", self.profileImage)
    }
    
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
    
    // MARK: - Fetching Users Selling Items
    func fetchUserSellingItems() {
        
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        
        Database.database().reference().child("users").child(currentUserUID).child("userSellingItems").observe(.childAdded) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            guard let item = Item(withDictionary: dictionary) else { return }
            self.userSellingItems.append(item)
            print("appended user selling shit", ItemController.shared.userSellingItems.count)
        }
    }
    
    
    
    // MARK: - Saving User Selling Item into DB
    func addUserSellingItems(item: Item) {
        
        self.userSellingItems.append(item)
        
        guard let currentUID = Auth.auth().currentUser?.uid else { return }
        
        guard let uploadData = UIImageJPEGRepresentation(item.image, 0.3) else { return }
        let imageID = UUID().uuidString
        
        Storage.storage().reference().child("images").child(imageID).putData(uploadData, metadata: nil) { (metadata, error) in
            
            if let error = error {
                print("error occured during storage putData", error)
            }
            
            guard let image = metadata?.downloadURL()?.absoluteString else { return }

            let dictionaryValue = ["title": item.title, "description": item.description, "image": image, "price": item.price] as [String: Any]
            
            Database.database().reference().child("users").child(currentUID).child("userSellingItems").childByAutoId().updateChildValues(dictionaryValue, withCompletionBlock: { (error, _) in
                if let error = error {
                    print("Error saving values to db", error)
                }
            })
        }
    }
    
    // MARK: - Saving All Items to DB
    func addAllSellingItems(item: Item) {
        
        self.allSellingItems.append(item)

        guard let uploadData = UIImageJPEGRepresentation(item.image, 0.3) else { return }
        let imageID = UUID().uuidString
        
        Storage.storage().reference().child("images").child(imageID).putData(uploadData, metadata: nil) { (metadata, error) in
            
            if let error = error {
                print("Error saving to storage", error)
            }
            
            guard let image = metadata?.downloadURL()?.absoluteString else { return }
            
            let dictionaryValues = ["title": item.title, "description": item.description, "image": image, "price": item.price] as [String: Any]
            
            Database.database().reference().child("allSellingItems").childByAutoId().updateChildValues(dictionaryValues) { (error, reference) in
                
                if let error = error {
                    print("Error saving dictionary into db", error)
                }
                
                print("Successfully saved all selling items into db")
            }
        }
    }
    
    // MARK: - Fetch User Cart Items
    func fetchuserCartItems() {
        
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        
        Database.database().reference().child("users").child(currentUserUID).child("cartItems").observe(.childAdded) { (snapshot) in
            
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            guard let item = Item(withDictionary: dictionary) else { return }
            self.userCartItems.append(item)
            print("User cart added!", self.userCartItems.count)
        }
    }
    
    // MARK: - Save User Selling Items into DB
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
            
            let dictionaryValues = ["title": item.title, "description": item.description, "image": image, "price": item.price] as [String: Any]
            Database.database().reference().child("users").child(currentUID).child("cartItems").childByAutoId().updateChildValues(dictionaryValues, withCompletionBlock: { (error, _) in
                if let error = error {
                    print("Error saving cart items to db", error)
                }
            })
        }
        
        print("User cart item added", ItemController.shared.userCartItems.count)
    }
    
    func fetchPurchasedItems() {
        
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        
        Database.database().reference().child("users").child(currentUserUID).child("userPurchasedItems").observeSingleEvent(of: .value) { (snapshot) in
            
            guard let purchasedItemsDictionary = snapshot.value as? [[String: Any]] else { return }
            
            var innerPurchasedItems = [Item]()
            
            for purchasedItemDictionary in purchasedItemsDictionary {
                
                guard let purchaseItem = Item(withDictionary: purchasedItemDictionary) else { return }
                
                innerPurchasedItems.append(purchaseItem)
            }
            
            self.userPurchasedItems = innerPurchasedItems
        }
    }
    
    
    
    func addUserPurchasedItems(item: Item) {
        
        userPurchasedItems.append(item)
        
        let uid = UUID().uuidString
        let values = ["userPurchasedItems": userPurchasedItems]
        
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        
        Database.database().reference().child("users").child(currentUserUID).child("userPurchasedItems").child(uid).updateChildValues(values) { (error, reference) in
            
            if let error = error {
                print("Error saving user purhcased items into Database:", error)
            }
            
            print("Successfully saved user purchased items into database")
        }
    }
}










