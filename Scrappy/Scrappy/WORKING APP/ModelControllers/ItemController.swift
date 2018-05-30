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
    var sellerImageAsString: String?
    var userSellingItems = [UserSellingItem]()
    var allSellingItems = [Item]()
    var userCartItems = [Item]()
    var userPurchasedItems = [Item]()
    
    // MARK: - GET Current User's Data
    func fetchUserData() {
        
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        
        Database.database().reference().child("users").child(currentUserUID).observeSingleEvent(of: .value) { (snapshot) in
            
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
    
    // MARK: - GET All Selling Items
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
    
    // MARK: - GET Profile Image
    // FIXME: - Fix the fetch to get seller's uid
    func fetchProfileImage() {
        
        guard let currentUID = Auth.auth().currentUser?.uid else { return }
        

        Database.database().reference().child("users").child(currentUID).observeSingleEvent(of: .value) { (snapshot) in
            
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            guard let profImage = ProfileImage(withDictionary: dictionary) else { return }
            guard let imageAsString = SellerImageAsString(withDictionary: dictionary) else { return }
            self.profileImage = profImage.image
            self.sellerImageAsString = imageAsString.sellerImageAsString
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
            self.sellerImageAsString = imageURL
            
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

            let dictionaryValue = ["title": item.title, "description": item.description, "image": image, "price": item.price] as [String: Any]
            
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
            
            let dictionaryValues = ["title": item.title, "description": item.description, "image": image, "price": item.price, "sellerName": self.profileName ?? "", "sellerUID": currentUID, "sellerProfImage": self.sellerImageAsString ?? ""] as [String: Any]
            
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
            
            let dictionaryValues = ["title": item.title, "description": item.description, "image": image, "price": item.price] as [String: Any]
            Database.database().reference().child("users").child(currentUID).child("cartItems").childByAutoId().updateChildValues(dictionaryValues, withCompletionBlock: { (error, _) in
                if let error = error {
                    print("Error saving cart items to db", error)
                }
            })
        }
        
        print("User cart item added", ItemController.shared.userCartItems.count)
    }
}










