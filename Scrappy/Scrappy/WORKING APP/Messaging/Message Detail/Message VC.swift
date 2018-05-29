//
//  MessageViewController.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/28/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    ///////////////////////////////////////////////////// MARK: Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(aInt)
        
        // Setup Nav
        setupNav()
        
        // Setup UI
        setupUI()
    }

    
    ///////////////////////////////////////////////////// MARK: Local Properties
    
    var aInt: Int!
    var username: String!
    
    // Keyboard
    var doneButton = UIBarButtonItem()
    let keyboardToolBar = UIToolbar()
    let messageContainerView = UIView()
    let messageTextField = UITextField()
    
    
    ///////////////////////////////////////////////////// MARK: Setup Nav Function
    
    private func setupNav() {
        self.navigationController?.navigationBar.tintColor = UIColor.orange
        self.navigationItem.title = username
    }
    
    
    ///////////////////////////////////////////////////// MARK: Setup UI Function
    
    private func setupUI() {
        
        // Main View
        self.view.backgroundColor = .white
        
        // 'doneButton'
        doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.dismissKeybord(_:)))
        
        // 'keyboardToolBar'
        keyboardToolBar.sizeToFit()
        keyboardToolBar.setItems([doneButton], animated: true)
        
        // 'messageContainerView'
        messageContainerView.frame = CGRect(x: 0, y: self.view.frame.height - 60, width: self.view.frame.width, height: 60)
        messageContainerView.backgroundColor = UIColor(white: 0.8, alpha: 1)
        
        // 'messageTextField'
        messageTextField.backgroundColor = .white
        messageTextField.frame = CGRect(x: 0, y: 0, width: 300, height: 40)
        messageTextField.center.x = messageContainerView.frame.width/2
        messageTextField.center.y = messageContainerView.frame.height/2
        messageTextField.placeholder = "  Start Message"
        messageTextField.layer.cornerRadius = 16
        messageTextField.textColor = UIColor.black
        let leftView = UILabel(frame: CGRect(x: 0, y: 0, width: 13, height: 0))
        leftView.backgroundColor = UIColor.clear
        messageTextField.leftView = leftView
        messageTextField.leftViewMode = .always
        
        
        
        /////// Add Subviews
        self.view.addSubview(messageContainerView)
        messageContainerView.addSubview(messageTextField)
    }
    
    @objc private func dismissKeybord(_ sender: UIBarButtonItem) {
        self.view.endEditing(true)
    }

}
