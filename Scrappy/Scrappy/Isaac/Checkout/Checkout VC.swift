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
    
    let checkoutHeaderLabel = UILabel()

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
    }
    
    
    func setupUI() {
        
        // Main View
        self.view.backgroundColor = UIColor.white
        
        // 'checkoutHeaderLabel'
        let checkoutHeaderLabelAT = NSMutableAttributedString(string: "Checkout ", attributes: [NSAttributedStringKey.foregroundColor: UIColor.orange, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 42) as Any])
        let pageLabelAT = NSMutableAttributedString(string: "Page", attributes: [NSAttributedStringKey.foregroundColor: UIColor.orange, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Regular", size: 42) as Any])
        checkoutHeaderLabelAT.append(pageLabelAT)
        checkoutHeaderLabel.attributedText = checkoutHeaderLabelAT
        checkoutHeaderLabel.frame = CGRect(x: 0, y: 30, width: 100, height: 20)
        checkoutHeaderLabel.sizeToFit()
        checkoutHeaderLabel.center.x = self.view.center.x
        
        
        // 'checkoutTableView'
        checkoutTableView.backgroundColor = UIColor.black
        checkoutTableView.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: 520)
        checkoutTableView.delegate = self
        checkoutTableView.dataSource = self
        checkoutTableView.separatorColor = UIColor.clear
        checkoutTableView.bounces = false
        checkoutTableView.rowHeight = 520
        
        
        // 'cardViewContainer'
        cardViewContainer.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: 200)
        cardViewContainer.backgroundColor = UIColor.black
        
        // 'cardLabel'
        let cardLabelAT = NSMutableAttributedString(string: "C a r d", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-DemiBold", size: 20) as Any])
        cardLabel.attributedText = cardLabelAT
        cardLabel.frame = CGRect(x: 20, y: 20, width: 0, height: 0)
        cardLabel.sizeToFit()
        
        // 'cardImageView'
        cardImageView.image = UIImage(named: "creditCard")
        cardImageView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        cardImageView.sizeToFit()
        cardImageView.center.x = (self.view.frame.width/2)
        cardImageView.center.y = 100
        
        // 'cardButton'
        cardButton.backgroundColor = UIColor.clear
        cardButton.frame = CGRect(x: 0, y: 0, width: cardImageView.frame.width + 10, height: cardImageView.frame.height + 10)
        cardButton.center.x = (self.view.frame.width/2 - 5)
        cardButton.center.y = 95
        //cardButton.addTarget(self, action: #selector(self.goToCardDetail(_:)), for: .touchUpInside)
        
        
        // 'addressViewContainer'
        addressViewContainer.backgroundColor = UIColor.black
        addressViewContainer.frame = CGRect(x: 0, y: 300, width: self.view.frame.width, height: 200)
        
        // 'addressLabel'
        let addressLabelAT = NSMutableAttributedString(string: "A d d r e s s", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-DemiBold", size: 20) as Any])
        addressLabel.attributedText = addressLabelAT
        addressLabel.frame = CGRect(x: 20, y: 20, width: 0, height: 0)
        addressLabel.sizeToFit()
        
        
        // 'orderViewContainer'
        orderViewContainer.backgroundColor = UIColor.black
        orderViewContainer.frame = CGRect(x: 0, y: 500, width: self.view.frame.width, height: 200)
        
        // 'orderLabel'
        let orderLabelAT = NSMutableAttributedString(string: "O r d e r  S u m m a r y", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-DemiBold", size: 20) as Any])
        orderLabel.attributedText = orderLabelAT
        orderLabel.frame = CGRect(x: 20, y: 20, width: 0, height: 0)
        orderLabel.sizeToFit()
        
        
        self.view.addSubview(checkoutHeaderLabel)
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
    
    
    
    func delegateFunction() {
        print("Delegate Confirmed!!!")
    }
    
    
    
    
    
    
    
    
    
    
    
    
////// End Of Class
}


