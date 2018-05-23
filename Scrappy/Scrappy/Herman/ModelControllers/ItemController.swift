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
        }
    }
    
    func fetchUserSellingItems() {
        
        
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        
        Database.database().reference().child("users").child(currentUserUID).child("sellingItems").observeSingleEvent(of: .value) { (snapshot) in
            
            guard let userSellingItemsDictionary = snapshot.value as? [[String: Any]] else { return }
            
            var innerUserSellingItems = [Item]()
            
            for userSellingItemDictionary in userSellingItemsDictionary {
                guard let userSellingItem = Item(withDictionary: userSellingItemDictionary) else { return }
                innerUserSellingItems.append(userSellingItem)
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
        
        for allSellingItemsDictionary in sellingItems {
            
            guard let description = allSellingItemsDictionary.description else { return }
            
            let dictionaryValue = ["title": allSellingItemsDictionary.title, "description": description, "price": allSellingItemsDictionary.price, "image": allSellingItemsDictionary.image]
            dictionaryValues.append(dictionaryValue)
        }
        
        let values = ["sellingItems": dictionaryValues]
        
        Database.database().reference().child("allSellingItems").updateChildValues(values) { (error, reference) in
            
            if let error = error {
                print("Error saving to database:", error)
            }
            
            print("Successfully saved sellingItems into Database!")
        }
    }
    
    func addUserSellingItems(item: Item) {
        
        userSellingItems.append(item)
        
        var dictionaryValues = [[String: Any]]()
        
        for userSellingItemsDictionary in userSellingItems {
            
            guard let description = userSellingItemsDictionary.description else { continue }
            
            let dictionaryValue = ["title": userSellingItemsDictionary.title, "description": description, "price": userSellingItemsDictionary.price, "image": userSellingItemsDictionary.image]
            dictionaryValues.append(dictionaryValue)
        }
        
        let values = ["userSellingItems": dictionaryValues]
        
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        
        Database.database().reference().child("users").child(currentUserUID).child("selling").updateChildValues(values) { (error, reference) in
            
            if let error = error {
                print("Error saving to database:", error)
            }
            
            print("Successfully saved userSellingItems to database")
        }
    }
    
    func addUserCartItems(item: Item) {
        
        userCartItems.append(item)
        
        let uid = UUID().uuidString
        let values = ["userCartItems": userCartItems]
        
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        
        Database.database().reference().child("users").child(currentUserUID).child("cartItems").child(uid).updateChildValues(values) { (error, reference) in
            
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
