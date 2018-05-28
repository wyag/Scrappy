//
//  ConvoViewController.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/28/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class ConvoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ConvoTableViewCellDelegate {
    

    ////////////////////////////////////////////////////////// MARK: Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Nav Bar
        setupNav()
        
        // Setup UI
        setupUI()
    }
    
    ////////////////////////////////////////////////////////// MARK: Local Properties
    
    let testLabel = UILabel()
    
    let convoTableView = UITableView()
    
    ////////////////////////////////////////////////////////// MARK: Setup Nav Function
    
    func setupNav() {
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.orange]
        self.navigationItem.title = "Convos"
    }
    
    
    ////////////////////////////////////////////////////////// MARK: Setup UI Function
    
    func setupUI() {
        
        // Main View
        self.view.backgroundColor = .orange
        
        // 'testLabel'
        let testLabelAT = NSMutableAttributedString(string: "Convos", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Regular", size: 36) as Any])
        testLabel.attributedText = testLabelAT
        testLabel.sizeToFit()
        testLabel.center.x = self.view.center.x
        testLabel.center.y = self.view.center.y
        
        // 'convoTableView'
        convoTableView.backgroundColor = UIColor.clear
        convoTableView.frame = CGRect(x: 0, y: 60, width: self.view.frame.width, height: self.view.frame.height - 60)
        convoTableView.rowHeight = 100
        convoTableView.separatorColor = .clear
        convoTableView.register(ConvoTableViewCell.self, forCellReuseIdentifier: "convoCell")
        convoTableView.delegate = self
        convoTableView.dataSource = self
        convoTableView.allowsSelection = false
        
        ////// Add Subviews
        self.view.addSubview(testLabel)
        self.view.addSubview(convoTableView)
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create/Cast Cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "convoCell", for: indexPath) as? ConvoTableViewCell else { return ConvoTableViewCell() }
        // Pretty Up Cell
        let cellFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.convoTableView.rowHeight)
        cell.setupCellUI(frame: cellFrame)
        cell.delegate = self
        // Return Cell
        return cell
    }
    
    
    func goToMessage(_ sender: UIButton) {
        
        print("Delegate Found!!")
        
        let nextVC = MessageViewController()
        nextVC.aInt = 4
        nextVC.username = "Username"
        
        self.navigationController?.show(nextVC, sender: self)
    }
    
    
    
    
    
    
    
    
    
    
    
//// End Of Class
}
