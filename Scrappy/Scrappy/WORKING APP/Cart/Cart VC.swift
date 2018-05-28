//
//  CartViewController.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/18/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    ///////////////////////////////////////////////////////////// MARK: Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cartTableView.reloadData()
    }

    
    ///////////////////////////////////////////////////////////// MARK: Local Properties
    
    // Cart Array
    var cartItems = [Item]()
    
    
    //////////////// MARK: Navigation Properties
    
    // Nav Menu UI
    let menu = CustomNavView(frame: UIScreen.main.bounds)
    let cartButton = UIBarButtonItem()
    var menuBarButton = UIBarButtonItem()
    var isMenuOpen: Bool = false
    
     //////////////// MARK: UI Properties
    
    // Cart's Item Table View
    let cartTableView = UITableView()
    let cartHeaderView = UIView()
    let cartHeaderLabel = UILabel()
    let checkoutButton = UIButton()
    
    
    ///////////////////////////////////////////////////////////// MARK: Load Cart Items
    

    ///////////////////////////////////////////////////////////// MARK: Setup Navigation Function's
    
    func setupNav() {
        
        // Setup Nav Bar
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.tintColor = UIColor.orange
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Regular", size: 22) as Any]
        self.navigationItem.title = " Cart "
    }
    
    
    
    //*********************************************************************************
    ///////////////////////////////////////////////////////////// MARK: Setup UI Function
    
    func setupUI() {
        
        // Setup Main View
        self.view.backgroundColor = UIColor.white
        
        // Table View
        
        // 'cartTableView'
        cartTableView.backgroundColor = UIColor.black
        cartTableView.frame = CGRect(x: 0, y: 60, width: self.view.frame.width, height: (self.view.frame.height - 60))
        cartTableView.rowHeight = 90
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.register(CartTableViewCell.self, forCellReuseIdentifier: "cartCell")
        cartTableView.separatorColor = UIColor.clear
        cartTableView.tableHeaderView = UIView()
        
        // 'checkoutButton'
        let checkoutButtonAT = NSMutableAttributedString(string: "Checkout", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-DemiBold", size: 24) as Any])
        checkoutButton.setAttributedTitle(checkoutButtonAT, for: .normal)
        checkoutButton.backgroundColor = UIColor.clear
        checkoutButton.layer.borderColor = UIColor.orange.cgColor
        checkoutButton.layer.borderWidth = 3
        checkoutButton.layer.cornerRadius = 26
        checkoutButton.layer.shadowColor = UIColor.white.cgColor
        checkoutButton.layer.shadowRadius = 4
        checkoutButton.layer.shadowOpacity = 1
        checkoutButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        checkoutButton.frame = CGRect(x: 0, y: (self.view.frame.height - 100), width: (self.view.frame.width/3 * 2), height: 60)
        checkoutButton.center.x = (self.view.center.x - 5)
        checkoutButton.addTarget(self, action: #selector(self.goToCheckout(_:)), for: .touchUpInside)
        
        ////////// Add Subview's
        
        self.view.addSubview(cartTableView)
        self.view.addSubview(checkoutButton)
    }
    
    
    ///////////////////////////////////////////////////////////// MARK: Table View Delegate Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemController.shared.userCartItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create/Cast Cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as? CartTableViewCell else { return CartTableViewCell() }
        // Item Image
        
        cell.cellImage = ItemController.shared.userCartItems[indexPath.row].image
        // Item Name
        cell.cellName = ItemController.shared.userCartItems[indexPath.row].title
        // Item Price
        cell.cellPrice = ItemController.shared.userCartItems[indexPath.row].price
        // Item Description
        cell.cellDescription = ItemController.shared.userCartItems[indexPath.row].description
        // Cell Frame
        cell.backgroundColor = UIColor.black
        let cellFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80)
        cell.setupCell(frame: cellFrame)
        // Return Cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // Header View
        cartHeaderView.backgroundColor = UIColor.black
        cartHeaderView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30)
        
        // Header Label
        var headerString = "items"
        if tableView.numberOfRows(inSection: 0) < 2 {
            headerString = "item"
        }
        let cartHeaderLabelAT = NSMutableAttributedString(string: "\(tableView.numberOfRows(inSection: 0)) \(headerString)", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Regular", size: 16) as Any])
        cartHeaderLabel.attributedText = cartHeaderLabelAT
        cartHeaderLabel.frame.size = CGSize(width: 100, height: 20)
        cartHeaderLabel.sizeToFit()
        cartHeaderLabel.center.x = cartHeaderView.center.x
        cartHeaderLabel.center.y = cartHeaderView.center.y
        cartHeaderView.addSubview(cartHeaderLabel)
        
        // Return View
        return cartHeaderView
    }
    
    
    @objc private func goToCheckout(_ sender: UIButton) {
        
        let settingsVC = SettingsViewController()
        
        var totalPrice = 0
        for item in ItemController.shared.userCartItems {
            let price = item.price
            totalPrice += price
        }

        let nextVC = StripeCheckOutViewController(price: totalPrice, settings: settingsVC.settings)
        self.navigationController?.show(nextVC, sender: self)
        
    }
    
////////// End Of Class
}
