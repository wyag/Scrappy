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
        
        if moreThanOneVC != nil && moreThanOneVC == true {
            guard var vcs = self.navigationController?.viewControllers else { return }
            for vc in vcs {
                if vcs.last == vc {
                    return
                }
                if !(vc.isKind(of: HomeViewController.classForCoder())) {
                    guard let index = vcs.index(of: vc) else { return }
                    vcs.remove(at: index)
                    self.navigationController?.viewControllers = vcs
                    return
                }
            }
        }
    }

    ////////////////////////////////////////////////////// MARK: Local Properties
    
    // Transition
    //var pushingOnLoad: Bool = false
    
    // Nav Menu
    let menuView = CustomNavigationViewController()
    let customNavBarView = UIView()
    let navTitleLabel = UILabel()
    let menuButton = UIButton()
    let cartButton = UIButton()
    var moreThanOneVC: Bool?
    
    // Table View
    let categoryTableView = UITableView()
    let numberOfCells = 6
    var cellCount = 1
    var cellImages: [UIImage]!
    var cellColors: [UIColor]!
    var cellNames: [String]!
    
    
    ////////////////////////////////////////////////////// MARK: SetupUI Function
    
    func setupNav() {
        
        // 'menuView'
        menuView.view.frame = self.view.frame
        menuView.view.alpha = 1
        menuView.closeMenuButton.addTarget(self, action: #selector(self.dismissMenu(_:)), for: .touchUpInside)
        
        self.accessibilityValue = "1"
        
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
        
        // 'cartButton'
        cartButton.setImage(UIImage(named: "basketorange"), for: .normal)
        cartButton.setImage(UIImage(named: "basketorange"), for: .highlighted)
        cartButton.setImage(UIImage(named: "basketorange"), for: .selected)
        cartButton.backgroundColor = UIColor.clear
        cartButton.frame = CGRect(x: 360, y: 0, width: 40, height: 40)
        
        
        /////// Add Subview's
        self.view.addSubview(menuView.view)
        self.view.addSubview(customNavBarView)
        customNavBarView.addSubview(navTitleLabel)
        navTitleLabel.center.x = customNavBarView.center.x
        navTitleLabel.center.y = self.view.frame.height/18.4
        customNavBarView.addSubview(menuButton)
        menuButton.center.y = self.view.frame.height/18.4
        customNavBarView.addSubview(cartButton)
        cartButton.center.y = self.view.frame.height/18.4
        
        //////// Add Targets to Menu Button's
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
        // MARK: Pages
        /*
         0 - Login
         1 - Home
         (2 - 7) - Collection View's
         8 - Any Collection Detail View
         9 - Cart
         10 - Profile
        */
        
        var nextVC: UIViewController!
        let vcS = [LoginViewController(),HomeViewController(), CollectionViewController(), CollectionViewController(), CollectionViewController(), CollectionViewController(), CollectionViewController(), CollectionViewController(), DetailCollectionViewController(), CartViewController(), ProfileSettingViewController()]
        let identifiers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
        guard let id = sender.accessibilityIdentifier else { return }
        if identifiers.contains(id) {
            guard let index = identifiers.index(of: id) else { return }
            nextVC = vcS[index]
        }
        guard let index = Int(self.accessibilityValue!) else { return }
        switch nextVC {
        case vcS[index]:
            dismissMenu(sender) ; return
        case vcS[0]:
            self.navigationController?.popToRootViewController(animated: true)
            return
        case vcS[2], vcS[3], vcS[4], vcS[5], vcS[6], vcS[7]:
            guard let destinationVC = (nextVC as? CollectionViewController) else { return }
            self.dismissMenu(sender)
            destinationVC.accessibilityValue = id
            self.navigationController?.show(destinationVC, sender: self)
            return
        case vcS[8]: return // Go To Detail View
        case vcS[9]:
            guard let destinationVC = (nextVC as? CartViewController) else { return }
            destinationVC.accessibilityValue = id
            self.navigationController?.show(nextVC, sender: self)
        case vcS[10]:
            guard let destinationVC = (nextVC as? ProfileSettingViewController) else { return }
            destinationVC.accessibilityValue = id
            self.navigationController?.show(nextVC, sender: self)
        default: self.dismissMenu(sender) ; return
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
        cell.cellButton.addTarget(self, action: #selector(self.cellWasTapped(_:)), for: .touchUpInside)
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
