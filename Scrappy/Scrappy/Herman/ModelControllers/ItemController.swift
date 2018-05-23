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
    
    func fetchSellingItems() {
        
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
        
        
        //        Database.database().reference().child("users").child(currentUserUID).child("userPurchasedItems").
    }
    
    func addSellingItem(item: Item) {
        
        sellingItems.append(item)
        
        let uid = UUID().uuidString
        let values = ["sellingItems": sellingItems]
        
        Database.database().reference().child("allSellingItems").child(uid).updateChildValues(values) { (error, reference) in
            
            if let error = error {
                print("Error saving to database:", error)
            }
            
            print("Successfully saved sellingItems into Database!")
        }
    }
    
    func addUserSellingItems(item: Item) {
        
        userSellingItems.append(item)
        
        let uid = UUID().uuidString
        
        let values = ["userSellingItems": userSellingItems]
        
        guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
        
        Database.database().reference().child("users").child(currentUserUID).child("userSellingItems").child(uid).updateChildValues(values) { (error, reference) in
            
            if let error = error {
                print("Error saving to database:", error)
            }
            
            print("Successfully saved userSellingItems to database")
        }
    }
    
    func userCartItems(item: Item) {
        
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
