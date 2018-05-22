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
        //setupNav()
        setupUI()
    }

    
    ///////////////////////////////////////////////////////////// MARK: Local Properties
    
    //////////////// MARK: Navigation Properties
    
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
    
    // Mock 'Item' Array Count
    var mockCount = 5
    
    // Mock 'Item' Data
    let images = [UIImage(named: "Shoppinglist"), UIImage(named: "Shoppinglist"), UIImage(named: "Shoppinglist"), UIImage(named: "Shoppinglist"), UIImage(named: "Shoppinglist")]
    let names = ["Holiday Reef", "Birthday Card", "Knitted Hotpads", "Handmade Drum", "Wood Glasses"]
    let prices = [12.97, 7.51, 120.99, 1000.43, 67.89]
    let descriptions = ["asdlkfnklsadfjaisdjf;klasdnl;asjrioejafdlksnasjdfl asdf jopwiefnlk;asd fasj faslkd fjlkas df;sd fsd fj sadfjkl;asdj fodf sd fsa jfdqpoweijfl;kasdnf dsf wa;efklasdf asjf qjwek;fnalk;sd f ioqwejfkla df jdf;lksa fn;lkasdnoiaeufqnflksad foaflkndflkasjio;enfl;ksnvkjahgoihejgdnakslfhqopuehfkdnasndf;oi  fas;ihf;asdjn.a  oijfasdj   jasl;kjfiqhdlaf fdjfsl.", "asdlkfnklsadfjaisdjf;klasdnl;asjrioejafdlksnasjdfl asdf jopwiefnlk;asd fasj faslkd fjlkas df;sd fsd fj sadfjkl;asdj fodf sd fsa jfdqpoweijfl;kasdnf dsf wa;efklasdf asjf qjwek;fnalk;sd f ioqwejfkla df jdf;lksa fn;lkasdnoiaeufqnflksad foaflkndflkasjio;enfl;ksnvkjahgoihejgdnakslfhqopuehfkdnasndf;oi  fas;ihf;asdjn.a  oijfasdj   jasl;kjfiqhdlaf fdjfsl.", "asdlkfnklsadfjaisdjf;klasdnl;asjrioejafdlksnasjdfl asdf jopwiefnlk;asd fasj faslkd fjlkas df;sd fsd fj sadfjkl;asdj fodf sd fsa jfdqpoweijfl;kasdnf dsf wa;efklasdf asjf qjwek;fnalk;sd f ioqwejfkla df jdf;lksa fn;lkasdnoiaeufqnflksad foaflkndflkasjio;enfl;ksnvkjahgoihejgdnakslfhqopuehfkdnasndf;oi  fas;ihf;asdjn.a  oijfasdj   jasl;kjfiqhdlaf fdjfsl.", "asdfad", "asdreagdgbad"]
    
    
    ///////////////////////////////////////////////////////////// MARK: Setup Navigation Function's
    
    func setupNav() {
        
        self.accessibilityValue = "Home"
        
        // Setup Nav Bar
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        
        // 'menuBarButton'
        menuBarButton = UIBarButtonItem(image: UIImage(named: "hMenu"), style: .plain, target: self, action: #selector(self.menuButtonTapped(_:)))
        menuBarButton.tintColor = UIColor.orange
        self.navigationItem.setLeftBarButton(menuBarButton, animated: false)
        
        menu.closeMenuButton.addTarget(self, action: #selector(self.menuButtonTapped(_:)), for: .touchUpInside)
        menu.homeMenuButton.addTarget(self, action: #selector(self.goToVC(_:)), for: .touchUpInside)
        menu.birthdayMenuButton.addTarget(self, action: #selector(self.goToVC(_:)), for: .touchUpInside)
        menu.sesonalMenuButton.addTarget(self, action: #selector(self.goToVC(_:)), for: .touchUpInside)
        menu.holidayMenuButton.addTarget(self, action: #selector(self.goToVC(_:)), for: .touchUpInside)
        menu.sportsMenuButton.addTarget(self, action: #selector(self.goToVC(_:)), for: .touchUpInside)
        menu.congratsMenuButton.addTarget(self, action: #selector(self.goToVC(_:)), for: .touchUpInside)
        menu.miscMenuButton.addTarget(self, action: #selector(self.goToVC(_:)), for: .touchUpInside)
        menu.cartMenuButton.addTarget(self, action: #selector(self.goToVC(_:)), for: .touchUpInside)
        menu.profileButton.addTarget(self, action: #selector(self.goToVC(_:)), for: .touchUpInside)
    }
    
    
    
    @objc private func menuButtonTapped(_ sender: UIBarButtonItem) {
        if !isMenuOpen {
            self.view.addSubview(menu)
            isMenuOpen = true
            menu.closeMenuButton.setImage(UIImage(named: "whiteX"), for: .normal)
            UIView.animate(withDuration: 1) {
                self.menu.navMenuView.frame.origin.x = 0
                self.menu.blurView.alpha = 1
                self.menu.closeMenuButton.alpha = 1
            }
        } else {
            print("Menu Closed")
            isMenuOpen = false
            menu.closeMenuButton.setImage(UIImage(named: "whiteX2"), for: .normal)
            UIView.animate(withDuration: 1, animations: {
                self.menu.blurView.alpha = 0
                self.menu.closeMenuButton.alpha = 0
                self.menu.navMenuView.frame.origin.x = ((self.view.frame.width/2) * -1)
            }) { (success) in
                if success {
                    self.menu.removeFromSuperview()
                }
            }
        }
    }
    
    
    @objc private func goToVC(_ sender: UIButton) {
        
        print("Nav Menu Button Pressed!!")
        
        // Unwrap Button ID
        guard let id = sender.accessibilityIdentifier else { return }
        guard let vcid = self.accessibilityValue else { return }
        
        // Switch On Button ID
        switch id {
        case vcid:
            menuButtonTapped(self.menuBarButton)
        case "Home":
            self.navigationController?.popToRootViewController(animated: true)
        case "Birthday":
            menuButtonTapped(menuBarButton)
            let nextVC = CollectionViewController()
            nextVC.accessibilityValue = "Birthday"
            self.navigationController?.show(nextVC, sender: self)
        case "Seasonal":
            menuButtonTapped(menuBarButton)
            let nextVC = CollectionViewController()
            nextVC.accessibilityValue = "Seasonal"
            self.navigationController?.show(nextVC, sender: self)
        case "Holiday":
            menuButtonTapped(menuBarButton)
            let nextVC = CollectionViewController()
            nextVC.accessibilityValue = "Holiday"
            self.navigationController?.show(nextVC, sender: self)
        case "Sports":
            menuButtonTapped(menuBarButton)
            let nextVC = CollectionViewController()
            nextVC.accessibilityValue = "Sports"
            self.navigationController?.show(nextVC, sender: self)
        case "Congrats":
            menuButtonTapped(menuBarButton)
            let nextVC = CollectionViewController()
            nextVC.accessibilityValue = "Congrats"
            self.navigationController?.show(nextVC, sender: self)
        case "Misc":
            menuButtonTapped(menuBarButton)
            let nextVC = CollectionViewController()
            nextVC.accessibilityValue = "Misc"
            self.navigationController?.show(nextVC, sender: self)
        case "Profile":
            menuButtonTapped(menuBarButton)
            let nextVC = ProfileSettingViewController()
            nextVC.accessibilityValue = "Profile"
            self.navigationController?.show(nextVC, sender: self)
        case "Cart":
            menuButtonTapped(menuBarButton)
            let nextVC = CartViewController()
            nextVC.accessibilityValue = "Cart"
            self.navigationController?.show(nextVC, sender: self)
        case "Logout":
            self.navigationController?.popToRootViewController(animated: true)
        default:
            menuButtonTapped(self.menuBarButton)
        }
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
