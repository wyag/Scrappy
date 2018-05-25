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
    
    var sellingItems = [Item]()
    var userSellingItems = [Item]()
    var userCartItems = [Item]()
    var userPurchasedItems = [Item]()
    
    func fetchAllSellingItems() {
        
        Database.database().reference().child("allSellingItems").observeSingleEvent(of: .value) { (snapshot) in
            
            guard let sellingItemsDictionary = snapshot.value as? [[String: Any]] else { return }
            
            var innerSellingItems = [Item]()
            
            for sellingItemDictionary in sellingItemsDictionary {
                
                
                
                
                guard let sellingItem = Item(withDictionary: sellingItemDictionary) else { return }
                innerSellingItems.append(sellingItem)
            }
            self.sellingItems = innerSellingItems
            print("Internal Selling Items", self.sellingItems.count)
        }
    }
    
    func fetchUserSellingItems() {
        
        
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        
        Database.database().reference().child("users").child(currentUserUID).child("sellingItems").observeSingleEvent(of: .value) { (snapshot) in
            
            guard let userSellingItemsDictionary = snapshot.value as? [[String: Any]] else { return }
            
            var innerUserSellingItems = [Item]()
            
            for userSellingItemDictionary in userSellingItemsDictionary {
                
//                let imageString = userSellingItemDictionary["image"] as? String
//                guard let imageURL = URL(string: imageString), let data = Data(contentsOf: imageURL), let i
//                guard let userSellingItem = Item(withDictionary: userSellingItemDictionary) else { return }
//                innerUserSellingItems.append(userSellingItem)
            }
            
            self.userSellingItems = innerUserSellingItems
        }
    }
    
    func fetchuserCartItems() {
        
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        
        Database.database().reference().child("users").child(currentUserUID).child("cartItems").observeSingleEvent(of: .value) { (snapshot) in
            
            guard let cartItemsDictionary = snapshot.value as? [[String: Any]] else { return }
            
            var innerCartItems = [Item]()
            
        
            
            for cartItemDictionary in cartItemsDictionary {
                guard let cartItem = Item(withDictionary: cartItemDictionary) else { return }
                innerCartItems.append(cartItem)
            }
            
            self.userCartItems = innerCartItems
        }
        
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
    
    func addAllSellingItems(item: Item) {
        
        sellingItems.append(item)
        
        var dictionaryValues = [[String: Any]]()
        
        for allSellingItems in sellingItems {
            
            guard let description = allSellingItems.description else { return }
            
            let dictionaryValue = ["title": allSellingItems.title, "description": description, "price": allSellingItems.price, "image": allSellingItems.image]
            dictionaryValues.append(dictionaryValue)
        }
        
        let values = ["allSellingItems": dictionaryValues]
        
        Database.database().reference().updateChildValues(values) { (error, reference) in
            
            if let error = error {
                print("Error saving to database:", error)
            }
            
            print("Successfully saved sellingItems into Database!")
        }
    }
    
    func addUserSellingItems(item: Item) {
        
        userSellingItems.append(item)
        
        var dictionaryValues = [[String: Any]]()
        
        for userSellingItem in userSellingItems {
            
            guard let description = userSellingItem.description else { continue }
            
            let dictionaryValue = ["title": userSellingItem.title, "description": description, "price": userSellingItem.price, "image": userSellingItem.image]
            dictionaryValues.append(dictionaryValue)
        }
        
        let values = ["userSellingItems": dictionaryValues]
        
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        
        Database.database().reference().child("users").child(currentUserUID).updateChildValues(values) { (error, reference) in
            
            if let error = error {
                print("Error saving to database:", error)
            }
            
            print("Successfully saved userSellingItems to database")
        }
    }
    
    func addUserCartItems(item: Item) {
        
        userCartItems.append(item)
        
        var dictionaryValues = [[String: Any]]()
        
        for userCartItemsDictionary in userCartItems {
            
            guard let description = userCartItemsDictionary.description else { continue }
            
            let dictionaryValue = ["title": userCartItemsDictionary.title, "description": description, "price": userCartItemsDictionary.price, "image": userCartItemsDictionary.image]
            dictionaryValues.append(dictionaryValue)
        }
        
        let values = ["userCartItems": userCartItems]
        
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        
        Database.database().reference().child("users").child(currentUserUID).child("cartItems").updateChildValues(values) { (error, reference) in
            
            if let error = error {
                print("Error saving cart items into database:", error)
            }
            
            print("Successfully saved cart items into database")
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










