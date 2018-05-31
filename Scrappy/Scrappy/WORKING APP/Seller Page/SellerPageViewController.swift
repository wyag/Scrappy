//
//  SellerPageViewController.swift
//  Scrappy
//
//  Created by Spencer Cawley on 5/31/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class SellerPageViewController: UIViewController {
    
    let sellerPageCellID = "SellerPageCellID"
    
    var sellerProfileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor.purple
        image.layer.cornerRadius = 62.5
        image.clipsToBounds = true
        return image
    }()
    
    var sellerUsername: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Username"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    var lineSeperator: UIImageView = {
        let line = UIImageView()
        line.alpha = 0.5
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = UIColor.black
        return line
    }()
    
    let sellerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        
        setupDelegates()
        
        sellerCollectionView.register(SellerPageCell.self, forCellWithReuseIdentifier: sellerPageCellID)
        
        // 'sellerProfileImage'
        view.addSubview(sellerProfileImage)
        sellerProfileImage.widthAnchor.constraint(equalToConstant: 125).isActive = true
        sellerProfileImage.heightAnchor.constraint(equalToConstant: 125).isActive = true
        sellerProfileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sellerProfileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        
        // 'sellerUsername'
        view.addSubview(sellerUsername)
        sellerUsername.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sellerUsername.topAnchor.constraint(equalTo: sellerProfileImage.bottomAnchor, constant: 5).isActive = true
        
        // 'lineSeperator'
        view.addSubview(lineSeperator)
        lineSeperator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineSeperator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        lineSeperator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        lineSeperator.topAnchor.constraint(equalTo: sellerUsername.bottomAnchor, constant: 5).isActive = true
        lineSeperator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        view.addSubview(sellerCollectionView)
        sellerCollectionView.topAnchor.constraint(equalTo: lineSeperator.bottomAnchor, constant: 15).isActive = true
        sellerCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        sellerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        sellerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension SellerPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupDelegates() {
        sellerCollectionView.delegate = self
        sellerCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
//        return ItemController.shared.userSellingItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sellerPageCellID, for: indexPath) as? SellerPageCell else { return UICollectionViewCell() }
        
        cell.sellersPostImage.backgroundColor = .red
//        cell.sellersPostImage.image = ItemController.shared.userSellingItems[indexPath.row].image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 5, right: 5)
    }
    
    
}
