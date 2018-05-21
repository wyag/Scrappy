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

    
    ///////////////////////////////////////////////////////////// MARK: Local Properties
    
    //////////////// MARK: Navigation Properties
    
    // Nav Menu
    let menuView = CustomNavigationViewController()
    let customNavBarView = UIView()
    let navTitleLabel = UILabel()
    let menuButton = UIButton()
    
     //////////////// MARK: UI Properties
    
    // Cart's Item Table View
    let cartTableView = UITableView()
    let cartHeaderView = UIView()
    let cartHeaderLabel = UILabel()
    let checkoutButton = UIButton()
    
    // Mock 'Item' Array Count
    var mockCount = 5
    
    // Mock 'Item' Data
    let images = [UIImage(named: "Shoppinglist"), UIImage(named: "Shoppinglist"), UIImage(named: "Shoppinglist"), UIImage(named: "Shoppinglist"), UIImage(named: "Shoppinglist")]
    let names = ["Holiday Reef", "Birthday Card", "Knitted Hotpads", "Handmade Drum", "Wood Glasses"]
    let prices = [12.97, 7.51, 120.99, 1000.43, 67.89]
    let descriptions = ["asdlkfnklsadfjaisdjf;klasdnl;asjrioejafdlksnasjdfl asdf jopwiefnlk;asd fasj faslkd fjlkas df;sd fsd fj sadfjkl;asdj fodf sd fsa jfdqpoweijfl;kasdnf dsf wa;efklasdf asjf qjwek;fnalk;sd f ioqwejfkla df jdf;lksa fn;lkasdnoiaeufqnflksad foaflkndflkasjio;enfl;ksnvkjahgoihejgdnakslfhqopuehfkdnasndf;oi  fas;ihf;asdjn.a  oijfasdj   jasl;kjfiqhdlaf fdjfsl.", "asdlkfnklsadfjaisdjf;klasdnl;asjrioejafdlksnasjdfl asdf jopwiefnlk;asd fasj faslkd fjlkas df;sd fsd fj sadfjkl;asdj fodf sd fsa jfdqpoweijfl;kasdnf dsf wa;efklasdf asjf qjwek;fnalk;sd f ioqwejfkla df jdf;lksa fn;lkasdnoiaeufqnflksad foaflkndflkasjio;enfl;ksnvkjahgoihejgdnakslfhqopuehfkdnasndf;oi  fas;ihf;asdjn.a  oijfasdj   jasl;kjfiqhdlaf fdjfsl.", "asdlkfnklsadfjaisdjf;klasdnl;asjrioejafdlksnasjdfl asdf jopwiefnlk;asd fasj faslkd fjlkas df;sd fsd fj sadfjkl;asdj fodf sd fsa jfdqpoweijfl;kasdnf dsf wa;efklasdf asjf qjwek;fnalk;sd f ioqwejfkla df jdf;lksa fn;lkasdnoiaeufqnflksad foaflkndflkasjio;enfl;ksnvkjahgoihejgdnakslfhqopuehfkdnasndf;oi  fas;ihf;asdjn.a  oijfasdj   jasl;kjfiqhdlaf fdjfsl.", "asdfad", "asdreagdgbad"]
    
    
    ///////////////////////////////////////////////////////////// MARK: Setup Navigation Function's
    
    func setupNav() {
        
        // 'menuView'
        menuView.view.frame = self.view.frame
        menuView.view.alpha = 1
        menuView.closeMenuButton.addTarget(self, action: #selector(self.dismissMenu(_:)), for: .touchUpInside)
        
        // 'customeNavBarView'
        self.navigationController?.navigationBar.isHidden = true
        customNavBarView.backgroundColor = UIColor.black
        customNavBarView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width/6.9)
        customNavBarView.alpha = 0.7
        
        // Setup Nav Title
        let navTitleLabelAT = NSMutableAttributedString(string: "Scrappy", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: self.view.frame.width/20.7) as Any])
        navTitleLabel.attributedText = navTitleLabelAT
        navTitleLabel.frame = CGRect(x: 0, y: 0, width: self.view.frame.width/4.14, height: self.view.frame.width/20.7)
        navTitleLabel.sizeToFit()
        
        // 'menuButton'
        menuButton.setImage(UIImage(named: "hMenu"), for: .normal)
        menuButton.setImage(UIImage(named: "hMenu"), for: .highlighted)
        menuButton.setImage(UIImage(named: "hMenu"), for: .selected)
        menuButton.backgroundColor = UIColor.clear
        menuButton.frame = CGRect(x: self.view.frame.width/20.7, y: 0, width: self.view.frame.width/13.8, height: self.view.frame.width/13.8)
        menuButton.addTarget(self, action: #selector(self.menuOpen(_:)), for: .touchUpInside)
        
        // Add Subview's
        self.view.addSubview(menuView.view)
        self.view.addSubview(customNavBarView)
        customNavBarView.addSubview(navTitleLabel)
        navTitleLabel.center.x = customNavBarView.center.x
        navTitleLabel.center.y = self.view.frame.height/18.4
        customNavBarView.addSubview(menuButton)
        menuButton.center.y = self.view.frame.height/18.4
        
        // Add Targets to Menu Button's
        menuView.homeMenuButton.addTarget(self, action: #selector(self.changeVC(_:)), for: .touchUpInside)
        menuView.birthdayMenuButton.addTarget(self, action: #selector(self.changeVC(_:)), for: .touchUpInside)
        menuView.sesonalMenuButton.addTarget(self, action: #selector(self.changeVC(_:)), for: .touchUpInside)
        menuView.holidayMenuButton.addTarget(self, action: #selector(self.changeVC(_:)), for: .touchUpInside)
        menuView.sportsMenuButton.addTarget(self, action: #selector(self.changeVC(_:)), for: .touchUpInside)
        menuView.congratsMenuButton.addTarget(self, action: #selector(self.changeVC(_:)), for: .touchUpInside)
        menuView.miscMenuButton.addTarget(self, action: #selector(self.changeVC(_:)), for: .touchUpInside)
        menuView.logOutMenuButton.addTarget(self, action: #selector(self.changeVC(_:)), for: .touchUpInside)
    }
    
    
    @objc private func menuOpen(_ sender: UIButton) {
        menuView.setupUI(view: self)
        self.view.bringSubview(toFront: menuView.view)
        menuView.view.alpha = 1
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            self.menuView.menuButtonTapped(sender)
        }, completion: nil)
    }
    
    @objc private func dismissMenu(_ sender: UIButton) {
        UIView.animate(withDuration: 1) {
            self.menuView.dismissNavMenu(sender)
            self.menuView.view.alpha = 0
        }
    }
    
    @objc private func changeVC(_ sender: UIButton) {
        var nextVC: UIViewController!
        let vcS = [HomeViewController(), CollectionViewController(), CollectionViewController(), CollectionViewController(), CollectionViewController(), CollectionViewController(), CollectionViewController()]
        let identifiers = ["1", "2", "3", "4", "5", "6", "7", "8"]
        guard let id = sender.accessibilityIdentifier else { return }
        if identifiers.contains(id) {
            guard let index = identifiers.index(of: id) else { return }
            nextVC = vcS[index]
        }
        nextVC.accessibilityValue = id
        self.navigationController?.show(nextVC, sender: self)
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
        checkoutButton.backgroundColor = UIColor.black
        checkoutButton.layer.borderColor = UIColor.white.cgColor
        checkoutButton.layer.borderWidth = 3
        checkoutButton.layer.cornerRadius = 26
        checkoutButton.layer.shadowColor = UIColor.white.cgColor
        checkoutButton.layer.shadowRadius = 4
        checkoutButton.layer.shadowOpacity = 1
        checkoutButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        checkoutButton.frame = CGRect(x: 0, y: (self.view.frame.height - 100), width: (self.view.frame.width/3 * 2), height: 60)
        checkoutButton.center.x = (self.view.center.x - 5)
        
        ////////// Add Subview's
        
        self.view.addSubview(cartTableView)
        self.view.addSubview(checkoutButton)
    }
    
    
    ///////////////////////////////////////////////////////////// MARK: Table View Delegate Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockCount
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create/Cast Cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as? CartTableViewCell else { return CartTableViewCell() }
        // Pretty Up Cell
        cell.cellImage = images[indexPath.row]
        cell.cellName = names[indexPath.row]
        cell.cellPrice = prices[indexPath.row]
        cell.cellDescription = descriptions[indexPath.row]
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
    
////////// End Of Class
}
