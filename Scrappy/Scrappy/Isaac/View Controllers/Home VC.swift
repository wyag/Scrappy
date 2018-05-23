//
//  HomeViewController.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/16/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    ////////////////////////////////////////////////////// MARK: Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Nav
        setupNav()
        
        // Setup UI
        setupUI()

    }

    ////////////////////////////////////////////////////// MARK: Local Properties
    
    
    // Nav Menu UI
    let menu = CustomNavView(frame: UIScreen.main.bounds)
    let cartButton = UIBarButtonItem()
    var menuBarButton = UIBarButtonItem()
    var isMenuOpen: Bool = false
    
    // Table View UI
    let categoryTableView = UITableView()
    let numberOfCells = 6
    var cellCount = 1
    var cellImages: [UIImage]!
    var cellColors: [UIColor]!
    var cellNames: [String]!
    
    
    ////////////////////////////////////////////////////// MARK: Setup Nav Function
    
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
        menu.seasonalMenuButton.addTarget(self, action: #selector(self.goToVC(_:)), for: .touchUpInside)
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
    
    
    
    
    
    ////////////////////////////////////////////////////////////// MARK: Setup UI Function
    
    func setupUI() {
        
        // Setup Main View
        self.view.backgroundColor = UIColor.white
        
        // Setup Cell Array's
        cellImages = [UIImage(named: "whitecake"), UIImage(named: "whiteflower"), UIImage(named: "whiteholiday"), UIImage(named: "whiteball"), UIImage(named: "whitegirl"), UIImage(named: "whitescissors")] as! [UIImage]
        cellColors = [UIColor.AppColorPalette.HomeGreen, UIColor.AppColorPalette.HomePurple, UIColor.AppColorPalette.HomeLightPurple, UIColor.AppColorPalette.HomePink, UIColor.AppColorPalette.HomeBlue, UIColor.AppColorPalette.HomeLightGreen]
        cellNames = ["Birthday", "Seasonal", "Holiday", "Sports", "Congrats", "Misc"]
        
        
        // 'categoryTableView'
        categoryTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "homeCell")
        // For Y: self.view.frame.width/6.9
        categoryTableView.frame = CGRect(x: 0, y: self.view.frame.width/6.9, width: self.view.frame.width, height: (self.view.frame.height - (self.view.frame.width/6.9)))
        categoryTableView.backgroundColor = UIColor.black
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        categoryTableView.rowHeight = 160
        categoryTableView.separatorColor = UIColor.clear
        
        
        self.view.addSubview(categoryTableView)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create/Cast Cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as? HomeTableViewCell else { return HomeTableViewCell() }
        // Find Path
        let image = cellImages[indexPath.row]
        let color = cellColors[indexPath.row]
        let name = cellNames[indexPath.row]
        // Pretty Up Cell
        cell.cellIconImage = image
        cell.cellColor = color
        cell.cellName = name
        cell.cellButton.accessibilityIdentifier = name
        cell.cellButton.addTarget(self, action: #selector(self.goToVC(_:)), for: .touchUpInside)
        cell.accessoryType = .disclosureIndicator
        cell.cellButton.accessibilityIdentifier = "\(indexPath.row)"
        let cellFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 160)
        cell.setupCellUI(cellFrame: cellFrame)
        // Return Cell
        return cell
    }
    
    
    //////////////////////////////////////////////////////////////////// MARK: Cell Button Function
    
    @objc func cellWasTapped(_ sender: UIButton) {
        print("Cell Was Tapped!")
        
        var nextVC: UIViewController!
        let identifiers = ["0", "1", "2", "3", "4", "5"]
        guard let id = sender.accessibilityIdentifier else { return }
        
        if identifiers.contains(id) {
            guard let index = identifiers.index(of: id) else { return }
            let vcS = [CollectionViewController(), CollectionViewController(), CollectionViewController(), CollectionViewController(), CollectionViewController(), CollectionViewController()]
            nextVC = vcS[index]
        }
        self.navigationController?.show(nextVC, sender: self)
    }
    
 
    
    
/////// End Of Class
}
