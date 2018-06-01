//
//  MessagesController.swift
//  Scrappy
//
//  Created by Herman Kwan on 6/1/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import Firebase

class MessagesController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillLayoutSubviews()
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MessagesControllerTableViewCell.self, forCellReuseIdentifier: "cellID")
//        observeMessages()
        
    }
    var messages = [TheMessages]()
    var messagesDictionary = [String: TheMessages]()
    
    func observeUserMessages() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let ref = Database.database().reference().child("user-messages").child(uid)
        ref.observe(.childAdded) { (snapshot) in
            let messageID = snapshot.key
            let messageReference = Database.database().reference().child("messages").child(messageID)
            
            messageReference.observeSingleEvent(of: .value, with: { (snapshot) in
                
                if let dictionary = snapshot.value as? [String: Any] {
                    let message = TheMessages(withDictionary: dictionary)
                    //                self.messages.append(message)
                    
                    if let toID = message.toID {
                        self.messagesDictionary[toID] = message
                        
                        self.messages = Array(self.messagesDictionary.values)
                        self.messages.sort(by: { $0.timeStamp! > $1.timeStamp! })
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }, withCancel: nil)
        }
    }
    func observeMessages() {
        let ref = Database.database().reference().child("messages")
        ref.observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: Any] {
                let message = TheMessages(withDictionary: dictionary)
//                self.messages.append(message)
                
                if let toID = message.toID {
                    self.messagesDictionary[toID] = message
                    
                    self.messages = Array(self.messagesDictionary.values)
                    self.messages.sort(by: { $0.timeStamp! > $1.timeStamp! })
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }, withCancel: nil)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return messages.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as? MessagesControllerTableViewCell else { return UITableViewCell() }

        let message = messages[indexPath.row]
        if let timeStamp = message.timeStamp {
            let timestampDate = Date(timeIntervalSince1970: TimeInterval(timeStamp))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm:ss a"
            cell.timeLabel.text = dateFormatter.string(from: timestampDate)
        }
        
        
        if let id = message.chatPartnerID() {
            let ref = Database.database().reference().child("users").child(id)
            ref.observeSingleEvent(of: .value) { (snapshot) in
                
                if let dictionary = snapshot.value as? [String: Any] {
                    cell.usernameLabel.text = dictionary["username"] as? String
                    
                    
                let profileImage = ProfileImage(withDictionary: dictionary)
                    cell.profileImageView.image = profileImage?.image
                }
            }
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatLogVC = ChatLogController(collectionViewLayout: UICollectionViewFlowLayout())
        let message = messages[indexPath.row]
        
        guard let chatPartnerID = message.chatPartnerID() else { return }
        
        let ref = Database.database().reference().child("users").child(chatPartnerID)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            guard let uid = Auth.auth().currentUser?.uid else { return }
            let user = MessageUser(uid: uid, withDictionary: dictionary)
            user?.uid = chatPartnerID
            chatLogVC.user = user
            self.navigationController?.pushViewController(chatLogVC, animated: true)
        }, withCancel: nil)
    }

}
