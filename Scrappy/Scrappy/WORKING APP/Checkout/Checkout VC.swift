//
//  CheckoutViewController.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/18/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CheckoutTableViewCellDelegate {
    
    

    ////////////////////////////////////////////////////////////// MARK: Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkoutTableView.register(CheckoutTableViewCell.self, forCellReuseIdentifier: "checkoutCell")
        
        setupNav()
        setupUI()
    }
    
    
    ////////////////////////////////////////////////////////////// MARK: Local Properties
    

    let checkoutTableView = UITableView()
    
    let cardViewContainer = UIView()
    let cardLabel = UILabel()
    let cardImageView = UIImageView()
    let cardButton = UIButton()
    let cardCheckMarkImageView = UIImageView()
    
    let addressViewContainer = UIView()
    let addressLabel = UILabel()
    
    
    let orderViewContainer = UIView()
    let orderLabel = UILabel()
    
    
    
    let confirmButton = UIButton()
    let exitButton = UIButton()
    
    ////////////////////////////////////////////////////////////// MARK: Setup Nav & UI Functions
    
    func setupNav() {
        self.navigationController?.navigationBar.tintColor = UIColor.orange
        let backItem = UIBarButtonItem()
        backItem.title = "Cart"
        self.navigationItem.backBarButtonItem = backItem
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.orange, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Regular", size: 22) as Any]
        self.navigationItem.title = " Checkout "
    }
    
    
    func setupUI() {
        
        // Main View
        self.view.backgroundColor = UIColor.white
        
        
        // 'checkoutTableView'
        checkoutTableView.backgroundColor = .white
        checkoutTableView.frame = CGRect(x: 0, y: 70, width: self.view.frame.width, height: (self.view.frame.height - 100))
        checkoutTableView.delegate = self
        checkoutTableView.dataSource = self
        checkoutTableView.separatorColor = UIColor.clear
        checkoutTableView.rowHeight = (self.view.frame.height - 70)
        
        self.view.addSubview(checkoutTableView)
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "checkoutCell", for: indexPath) as? CheckoutTableViewCell else { return CheckoutTableViewCell() }
        cell.setupCellUI(frame: self.view.frame)
        cell.delegate = self
        return cell
    }
    
    
    
    func delegateFunction(vcid: String) {
        switch vcid {
        case "Card":
            let nextVC = UserPaymentViewController()
            present(nextVC, animated: true, completion: nil)
        case "Address":
            let nextVC = AddressViewController()
            present(nextVC, animated: true, completion: nil)
        default: return
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
////// End Of Class
}


