//
//  CollectionViewController.swift
//  Scrappy
//
//  Created by Spencer Cawley on 5/15/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

protocol CollectionViewControllerDelegate: class {
    func logoutButtonTapped()
}

class CollectionViewController: UIViewController {
    
    // Properties
    let itemController = ItemController.shared
    
    let topSellerImagesID = "TopSellerImagesID"
    let allImageCellID = "ImageCellID"
    let raiting = 4
    var allSellingItemsIsFetch = false
    var userDataIsFetched = false
    
    var isMenuTapped = false
    
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
    
    let refresher: UIRefreshControl = {
       let refresh = UIRefreshControl()
        refresh.tintColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        refresh.addTarget(self, action: #selector(pullToFetchData), for: .valueChanged)
        return refresh
    }()
    
    @objc func pullToFetchData() {
        
        self.bottomCollectionView.reloadData()
        self.refresher.endRefreshing()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupMenuView()

        if allSellingItemsIsFetch == false {
            
            
            ItemController.shared.fetchAllSellingItems { (allItems) -> (Void) in
                if let allItems = allItems {
                    
                    DispatchQueue.main.async {
                        ItemController.shared.allSellingItems = allItems
                        self.bottomCollectionView.reloadData()
                    }
                    
                }
            }
            
            ItemController.shared.fetchUserDataWoo { (sellerItems, items, image, name) in
                
                if let sellerItems = sellerItems, let items = items {
                    
                    DispatchQueue.main.async {
                        ItemController.shared.userSellingItems = sellerItems
                        ItemController.shared.userCartItems = items
                        ItemController.shared.profileImage = image
                        ItemController.shared.profileName = name
                        self.profileImageButton.setImage(image, for: .normal)
                        self.profileName.text = name
                        self.bottomCollectionView.reloadData()
                    }
                }
            }
            allSellingItemsIsFetch = true
        }
        
        self.bottomCollectionView.reloadData()
        menu.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 236/255.0, green: 236/255.0, blue: 236/255.0, alpha: 1)
//        setupNav()
        setupViews()
        bottomCollectionView.refreshControl = refresher
        blurEffectView.frame = view.frame
        
        navigationController?.navigationBar.tintColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        navigationItem.title = "New Items"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.orange, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Regular", size: 22) as Any]
//        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)]
//        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "hMenu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(menuViewButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "cart").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(cartButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 255/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(blurViewTapped))
        blurEffectView.addGestureRecognizer(tapGesture)
    }
    
    // MARK: Navbar
    let menuView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        return view
    }()
    
    let profileImageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 40
        button.backgroundColor = UIColor.lightGray
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 0.3
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(profileImageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let profileName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    let sellAnItemButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Sell An Item", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.addTarget(self, action: #selector(sellAnItemButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let messengerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(#imageLiteral(resourceName: "messageIcon"), for: .normal)
        button.addTarget(self, action: #selector(messageButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    lazy var closeMenuButton: UIButton = {
        let bt = UIButton()
        bt.frame = CGRect(x: self.view.frame.width/2, y: 0, width: self.view.frame.width/2, height: self.view.frame.height)
        bt.backgroundColor = .clear
        bt.setImage(UIImage(named: "whiteX"), for: .normal)
        bt.setImage(UIImage(named: "whiteX2"), for: .selected)
        bt.addTarget(self, action: #selector(self.menuViewButtonTapped), for: .touchUpInside)
        bt.alpha = 0
        return bt
    }()
    
    @objc func messageButtonTapped() {
        let messageController = MessagesController()
        messageController.messages.removeAll()
        messageController.messagesDictionary.removeAll()
        messageController.tableView.reloadData()
        messageController.observeUserMessages()
        navigationController?.pushViewController(messageController, animated: true)
//        let chatLogController = ChatLogController(collectionViewLayout: UICollectionViewFlowLayout())
//        navigationController?.pushViewController(chatLogController, animated: true)
    }
    
    @objc func sellAnItemButtonTapped() {
        navigationController?.pushViewController(AddItemViewController(), animated: true)
    }
    
    let logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log Out", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func profileImageButtonTapped() {
        let profileSettingVC = ProfileSettingViewController()
        profileSettingVC.delegate = self 
        navigationController?.pushViewController(profileSettingVC, animated: true)
    }
    
    @objc private func logoutButtonTapped() {
        let logoutNotification = Notification.Name(rawValue: "LogOutNotification")
        NotificationCenter.default.post(name: logoutNotification, object: nil)
        handleLogOut()
    }
    
    func handleLogOut() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Log out", style: .destructive, handler: { (_) in
            
            if Auth.auth().currentUser != nil {
                
                do {
                    try Auth.auth().signOut()
                    ItemController.shared.allSellingItems.removeAll()
                    ItemController.shared.userSellingItems.removeAll()
                    ItemController.shared.userCartItems.removeAll()
                    self.dismiss(animated: true, completion: nil)
                } catch {
                    print("Error signing out", error)
                }
            }
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    let blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        return blurEffectView
    }()
    
    // MARK: Nav Bar Constraints
    func setupMenuView() {
        view.addSubview(menuView)
        menuView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        menuView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.45).isActive = true
        menuView.trailingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        menuView.addSubview(profileImageButton)
        profileImageButton.centerXAnchor.constraint(equalTo: menuView.centerXAnchor).isActive = true
        profileImageButton.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 20).isActive = true
        profileImageButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        profileImageButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        menuView.addSubview(messengerButton)
        messengerButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        messengerButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        messengerButton.leadingAnchor.constraint(equalTo: profileImageButton.trailingAnchor).isActive = true
        messengerButton.bottomAnchor.constraint(equalTo: profileImageButton.bottomAnchor).isActive = true
        
        
        menuView.addSubview(profileName)
        profileName.centerXAnchor.constraint(equalTo: menuView.centerXAnchor).isActive = true
        profileName.topAnchor.constraint(equalTo: profileImageButton.topAnchor, constant: 90).isActive = true
        profileName.widthAnchor.constraint(equalTo: menuView.widthAnchor).isActive = true
        
        menuView.addSubview(sellAnItemButton)
        sellAnItemButton.centerXAnchor.constraint(equalTo: menuView.centerXAnchor).isActive = true
        sellAnItemButton.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 80).isActive = true
        sellAnItemButton.widthAnchor.constraint(equalTo: menuView.widthAnchor).isActive = true
        
        menuView.addSubview(logoutButton)
        logoutButton.bottomAnchor.constraint(equalTo: menuView.bottomAnchor, constant: -10).isActive = true
        logoutButton.widthAnchor.constraint(equalTo: menuView.widthAnchor, multiplier: 0.7).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        logoutButton.centerXAnchor.constraint(equalTo: menuView.centerXAnchor).isActive = true
               self.view.addSubview(self.blurEffectView)
        blurEffectView.alpha = 0 
    }
    
    @objc func blurViewTapped() {
        isMenuTapped = false
        
        UIView.animate(withDuration: 0.7) {
            self.menuView.transform = CGAffineTransform(translationX: -(self.view.frame.width * 0.45), y: 0)
            self.blurEffectView.alpha = 0
        }
    }
    
    @objc func menuViewButtonTapped() {
        if isMenuTapped == false {
            isMenuTapped = true
            UIView.animate(withDuration: 0.7) {
                self.menuView.transform = CGAffineTransform(translationX: self.view.frame.width * 0.45, y: 0)
         
                self.view.bringSubview(toFront: self.menuView)
                self.blurEffectView.alpha = 0.8
            }
        } else {
            isMenuTapped = false
            
            UIView.animate(withDuration: 0.7) {
                self.menuView.transform = CGAffineTransform(translationX: -(self.view.frame.width * 0.45), y: 0)
                self.blurEffectView.alpha = 0
            }
        }
    }
    
    @objc func cartButtonTapped() {
        navigationController?.pushViewController(CartViewController(), animated: true)
    }
    
    func setupViews() {
        
        setUpDelegates()
        
        // Register Collection Views
        bottomCollectionView.register(BottomImagesCell.self, forCellWithReuseIdentifier: allImageCellID)
        
        // 'bottomCollectionView'
        view.addSubview(bottomCollectionView)
        bottomCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        bottomCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        bottomCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc private func addItem(_ sender: UIButton) {
        let addItemVC = AddItemViewController()
        show(addItemVC, sender: self)
    }
   
    // Mark: - Setting up Navigation Bar
    let menu = CustomNavView(frame: UIScreen.main.bounds)
    let cartButton = UIBarButtonItem()
    var menuBarButton = UIBarButtonItem()
    var isMenuOpen: Bool = false
   
}

// Mark: - Extension for Delegate/Datasource
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    // Delegates
    func setUpDelegates() {
        bottomCollectionView.delegate = self
        bottomCollectionView.dataSource = self
    }
    
    // Datasource Functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemController.allSellingItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = ItemController.shared.allSellingItems[indexPath.row]
        let detailCollectionVC = DetailCollectionViewController()
        DispatchQueue.main.async {
            SellerController.shared.fetchSellerInfo(uid: item.sellerUID) { (seller) in
                if let seller = seller {
                    
                    
                    SellerController.shared.seller = seller
                    detailCollectionVC.sellerProfileImage.image = SellerController.shared.seller.image
                    detailCollectionVC.sellerUsername.text = SellerController.shared.seller.name
                    detailCollectionVC.sellerUID = item.sellerUID
                    self.navigationController?.show(detailCollectionVC, sender: self)
                    
                    
                }
            }
        }
        
        detailCollectionVC.itemImage = item.image
        detailCollectionVC.itemTitle = item.title
        detailCollectionVC.itemPrice = item.price
        detailCollectionVC.raitingNumber = self.raiting
        detailCollectionVC.cardDescription = item.description
        

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: allImageCellID, for: indexPath) as? BottomImagesCell else { return UICollectionViewCell() }
        
        cell.cellLabel.text = ItemController.shared.allSellingItems[indexPath.row].title
        cell.imageView.image = ItemController.shared.allSellingItems[indexPath.row].image
        cell.priceLabel.text = "$\(ItemController.shared.allSellingItems[indexPath.row].price)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 2.5), height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 25, bottom: 25, right: 15)
    }
}

extension CollectionViewController: ProfileSettingViewControllerDelegate {
    func profileButtonTapped(image: UIImage) {
        self.profileImageButton.setImage(image, for: .normal)
    }
}





