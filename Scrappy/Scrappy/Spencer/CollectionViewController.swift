//
//  CollectionViewController.swift
//  Scrappy
//
//  Created by Spencer Cawley on 5/15/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    
    
    
    // Properties
    
    // Nav Menu UI
    let menu = CustomNavView(frame: UIScreen.main.bounds)
    let cartButton = UIBarButtonItem()
    var menuBarButton = UIBarButtonItem()
    var isMenuOpen: Bool = false
    
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
    
    let raiting = 4
    let allImageCellID = "ImageCellID"
    let topSellerImagesID = "TopSellerImagesID"

    let topImagesArray = ["Donald Trump B-Day", "Donald Trump B-Day", "Donald Trump B-Day", "Donald Trump B-Day", "Donald Trump B-Day"]
    let allImagesArray = ["Donald Trump B-Day", "Donald Trump B-Day", "Donald Trump B-Day", "Donald Trump B-Day", "Donald Trump B-Day", "Donald Trump B-Day", "Donald Trump B-Day", "Donald Trump B-Day", "Donald Trump B-Day", "Donald Trump B-Day", "Donald Trump B-Day", "Donald Trump B-Day"]
    let cardDescription = "'Sorry losers and haters, but my I.Q. is one of the highest - and you all know it! Please don't feel so stupid or insecure, it's not your fault' - The Donald"
    
    let TopSellerLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Top Sellers"
        label.textAlignment = .center
//        label.font.withSize(25)
        return label
    }()
    
    let topCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 30
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.tag = 0
        return cv
    }()
    
    let bottomCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.tag = 1
        return cv
    }()
    
    let addItemButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "addButton"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setupNav()
        setupViews()
    }
    
    func setupViews() {
        
        
        
        setUpDelegates()
        self.navigationController?.navigationBar.isHidden = true
        
        // Register Collection Views
        topCollectionView.register(TopSellerImagesCell.self, forCellWithReuseIdentifier: topSellerImagesID)
        bottomCollectionView.register(BottomImagesCell.self, forCellWithReuseIdentifier: allImageCellID)
        
        // 'bottomCollectionView'
        view.addSubview(bottomCollectionView)
        bottomCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        bottomCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.6).isActive = true
        bottomCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // 'topCollectionView'
        view.addSubview(topCollectionView)
        topCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        topCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.4).isActive = true
        topCollectionView.bottomAnchor.constraint(equalTo: bottomCollectionView.topAnchor).isActive = true
        topCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        // 'addItemButton'
        view.addSubview(addItemButton)
        addItemButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        addItemButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addItemButton.leadingAnchor.constraint(equalTo: topCollectionView.leadingAnchor, constant: 20).isActive = true
        addItemButton.bottomAnchor.constraint(equalTo: topCollectionView.topAnchor, constant: -10).isActive = true
        addItemButton.addTarget(self, action: #selector(addItem(_:)), for: .touchUpInside)
        
        // 'topSellerLabel'
//        view.addSubview(TopSellerLabel)
//        TopSellerLabel.topAnchor.constraint(equalTo: customNavBarView.bottomAnchor, constant: 10).isActive = true
//        TopSellerLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
////        TopSellerLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
//        TopSellerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc private func addItem(_ sender: UIButton) {
        let addItemVC = AddItemViewController()
        show(addItemVC, sender: self)
    }
    
   
}

// Mark: - Extension for Delegate/Datasource
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    // Delegates
    func setUpDelegates() {
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        bottomCollectionView.delegate = self
        bottomCollectionView.dataSource = self
    }
    
    // Datasource Functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0  {
            return topImagesArray.count
        }
        return allImagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0 {
            print(topImagesArray[indexPath.item])
            let detailCollectionVC = DetailCollectionViewController()
            detailCollectionVC.itemImage = UIImage(named: topImagesArray[indexPath.item])
            detailCollectionVC.itemTitle = topImagesArray[indexPath.item].capitalized
            detailCollectionVC.raitingNumber = raiting
            detailCollectionVC.cardDescription = cardDescription
//            show(detailCollectionVC, sender: self)
            navigationController?.show(detailCollectionVC, sender: self)
            
        } else {
            print(allImagesArray[indexPath.item])
            let detailCollectionVC = DetailCollectionViewController()
            detailCollectionVC.itemImage = UIImage(named: allImagesArray[indexPath.item])
            detailCollectionVC.itemTitle = allImagesArray[indexPath.item].capitalized
            detailCollectionVC.raitingNumber = raiting
            detailCollectionVC.cardDescription = cardDescription
//            show(detailCollectionVC, sender: self)
            navigationController?.show(detailCollectionVC, sender: self)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topSellerImagesID, for: indexPath) as! TopSellerImagesCell
            cell.images = topImagesArray[indexPath.item]
//            cell.cellLabel = allImagesArray[indexPath.item].capitalized
//            cell.itemRaiting = raiting
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: allImageCellID, for: indexPath) as! BottomImagesCell
        cell.images = allImagesArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1 {
            return CGSize(width: (view.frame.width / 2) - 5, height: 200)
        }
        return CGSize(width: (view.frame.width / 2.5), height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView.tag == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 14)
        }
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
}
