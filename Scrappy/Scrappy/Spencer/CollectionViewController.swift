//
//  CollectionViewController.swift
//  Scrappy
//
//  Created by Spencer Cawley on 5/15/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    // Properties
    let allImageCellID = "ImageCellID"
    let topSellerImagesID = "TopSellerImagesID"
    
    let topImagesArray = ["topSeller1", "topSeller2", "topSeller3", "topSeller4", "topSeller5", ]
    let allImagesArray = ["image1", "image2", "image3", "image4", "image5", "image6", "image7", "image8", "image9",]
    
    let menuView = CustomNavigationViewController()
    let menuButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        setupViews()
    }
    
    let imageView: UIView = {
        let iv = UIView()
        iv.contentMode = .scaleToFill
        iv.backgroundColor = UIColor.white
        return iv
    }()
    
  
    
    let bottomCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    func setupViews() {
        
        self.navigationController?.navigationBar.isHidden = true
        
        
        bottomCollectionView.delegate = self
        bottomCollectionView.dataSource = self
        
        bottomCollectionView.register(TopSellerImagesCell.self, forCellWithReuseIdentifier: topSellerImagesID)
        bottomCollectionView.register(AllImagesCell.self, forCellWithReuseIdentifier: allImageCellID)
        
        imageViewConstraints()
        bottomCollectionViewConstraints()
//
        // 'menuButton'
        menuButton.frame = CGRect(x: 20, y: 20, width: 40, height: 40)
        menuButton.backgroundColor = UIColor.black
        menuButton.addTarget(self, action: #selector(self.menuOpen(_:)), for: .touchDown)

        // 'menuView'
        self.view.addSubview(menuButton)
    }
    
    @objc func menuOpen(_ sender: UIButton) {
        
        menuView.view.alpha = 1
        menuView.view.frame = self.view.frame
        menuView.view.alpha = 1
        menuView.setupUI()
        self.view.addSubview(menuView.view)
        self.view.bringSubview(toFront: menuView.view)
        menuView.closeMenuButton.addTarget(self, action: #selector(self.dismissMenu(_:)), for: .touchUpInside)


        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            self.menuView.menuButtonTapped(sender)
        }, completion: nil)
    }

    @objc func dismissMenu(_ sender: UIButton) {
        UIView.animate(withDuration: 1) {
            self.menuView.dismissNavMenu(sender)
            self.menuView.view.alpha = 0
        }
    }
    
    func imageViewConstraints() {
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 60, width: self.view.frame.width, height: self.view.frame.height)
    }
    
//    func topCollectionViewConstraints() {
//        view.addSubview(topCollectionView)
//        topCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        topCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.4).isActive = true
//        topCollectionView.bottomAnchor.constraint(equalTo: bottomCollectionView.topAnchor).isActive = true
//        topCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//    }
    
    func bottomCollectionViewConstraints() {
        view.addSubview(bottomCollectionView)
        bottomCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        bottomCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.6).isActive = true
        bottomCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1  {
            return allImagesArray.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            print("tapped")
            
        }
        
        print(allImagesArray[indexPath.item])
        let detailCollectionVC = DetailCollectionViewController()
        detailCollectionVC.itemImage = UIImage(named: allImagesArray[indexPath.item])
        detailCollectionVC.itemTitle = allImagesArray[indexPath.item].capitalized
        present(detailCollectionVC, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: allImageCellID, for: indexPath) as! AllImagesCell
            cell.images = allImagesArray[indexPath.item]
            return cell
        }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topSellerImagesID, for: indexPath) as! TopSellerImagesCell
        cell.images = topImagesArray[indexPath.item]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
//            return CGSize(width: (view.frame.width / 3) - 16, height: 250)
            return CGSize(width: (view.frame.width / 3) - 16, height: 100)
        }
        return CGSize(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
            return UIEdgeInsets(top: 10, left: 14, bottom: 10, right: 14)
        }
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
}
