//
//  CollectionViewController.swift
//  Scrappy
//
//  Created by Spencer Cawley on 5/15/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    
    // Nav Menu
    let menuView = CustomNavigationViewController()
    let customNavBarView = UIView()
    let navTitleLabel = UILabel()
    let menuButton = UIButton()
    
    // Properties
    let allImageCellID = "ImageCellID"
    let topSellerImagesID = "TopSellerImagesID"
    
    let topImagesArray = ["topSeller1", "topSeller2", "topSeller3", "topSeller4", "topSeller5"]
    let allImagesArray = ["image1", "image2", "image3", "image4", "image5", "image6", "image7", "image8", "image9"]
    
    let topCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setupViews()
    }
    
    func setupViews() {
        
        //////////////// MARK: Setup Navigation
        
        // 'menuView'
        menuView.view.frame = self.view.frame
        menuView.view.alpha = 1
        
        self.accessibilityValue = "3"
        
        menuView.closeMenuButton.addTarget(self, action: #selector(self.dismissMenu(_:)), for: .touchUpInside)
        
        // 'customeNavBarView'
        self.navigationController?.navigationBar.isHidden = true
        customNavBarView.backgroundColor = UIColor.orange
        customNavBarView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width/6.9)
        
        // Setup Nav Title
        let navTitleLabelAT = NSMutableAttributedString(string: "Home", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: self.view.frame.width/20.7) as Any])
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
        
        setUpDelegates()
        self.navigationController?.navigationBar.isHidden = true
        
        // Register Collection Views
        topCollectionView.register(TopSellerImagesCell.self, forCellWithReuseIdentifier: topSellerImagesID)
        bottomCollectionView.register(AllImagesCell.self, forCellWithReuseIdentifier: allImageCellID)
        
        view.addSubview(bottomCollectionView)
        bottomCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        bottomCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.5).isActive = true
        bottomCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(topCollectionView)
        topCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        topCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.5).isActive = true
        topCollectionView.bottomAnchor.constraint(equalTo: bottomCollectionView.topAnchor).isActive = true
        topCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true
        
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
}

// Delegate/Datasource Extension
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
            present(detailCollectionVC, animated: true, completion: nil)
        }
        print(allImagesArray[indexPath.item])
        let detailCollectionVC = DetailCollectionViewController()
        detailCollectionVC.itemImage = UIImage(named: allImagesArray[indexPath.item])
        detailCollectionVC.itemTitle = allImagesArray[indexPath.item].capitalized
        present(detailCollectionVC, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topSellerImagesID, for: indexPath) as! TopSellerImagesCell
            cell.images = topImagesArray[indexPath.item]
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: allImageCellID, for: indexPath) as! AllImagesCell
        cell.images = allImagesArray[indexPath.item]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1 {
            return CGSize(width: (view.frame.width / 3) - 16, height: 100)
        }
        return CGSize(width: (view.frame.width / 3), height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView.tag == 0 {
            return UIEdgeInsets(top: 10, left: 14, bottom: 10, right: 14)
        }
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
}
