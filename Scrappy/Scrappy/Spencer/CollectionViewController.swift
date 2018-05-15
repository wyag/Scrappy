//
//  CollectionViewController.swift
//  Scrappy
//
//  Created by Spencer Cawley on 5/15/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

protocol AllImagesCellDelegate: class {
    
    func goToDetailVC(cellImage image: UIImage)
}

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, AllImagesCellDelegate {
    
    
    func goToDetailVC(cellImage image: UIImage) {
        
        let nextVC = DetailCollectionViewController()
        nextVC.itemImage = image
        self.navigationController?.show(nextVC, sender: self)
    }
    
    
    let allImageCellID = "ImageCellID"
    let topSellerImagesID = "TopSellerImagesID"
    let topImagesArray = ["topSeller1", "topSeller2", "topSeller3", "topSeller4", "topSeller5", ]
    let allImagesArray = ["image1", "image2", "image3", "image4", "image5", "image6", "image7", "image8", "image9",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.backgroundColor = UIColor.white
        return iv
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    func setupViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(AllImagesCell.self, forCellWithReuseIdentifier: allImageCellID)
        collectionView.register(TopSellerImagesCell.self, forCellWithReuseIdentifier: topSellerImagesID)
        
        imageViewConstraints()
        collectionViewConstraints()
    }
    
    func imageViewConstraints() {
        view.addSubview(imageView)
        imageView.frame = self.view.frame
    }
    
    func collectionViewConstraints() {
        view.addSubview(collectionView)
        collectionView.frame = self.imageView.frame
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: allImageCellID, for: indexPath) as! AllImagesCell
            cell.images = allImagesArray[indexPath.item]
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topSellerImagesID, for: indexPath) as! TopSellerImagesCell
        cell.images = topImagesArray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: (view.frame.width / 3) - 16, height: 100)
        }
        return CGSize(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
            return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
        }
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

//class AllImagesCell: UICollectionViewCell {
//
//    var images: String? {
//        didSet {
//            if let imageName = images {
//                imageView.image = UIImage(named: imageName)
//            }
//        }
//    }
//
//    weak var delegate: AllImagesCellDelegate?
//
//    let imageView: UIImageView = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleAspectFit
//        iv.clipsToBounds = true
//        iv.layer.cornerRadius = 15
//        return iv
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
//
//    func setupViews() {
//        addSubview(imageView)
//        imageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}

//class TopSellerImagesCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//    let cellID = "cellID"
//    var images: [String]? {
//        didSet {
//            collectionView.reloadData()
//        }
//    }
//
//    let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 30
//        layout.scrollDirection = .horizontal
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.backgroundColor = .clear
//        return cv
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
//
//    func setupViews() {
//        addSubview(collectionView)
//        collectionView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(IconsCell.self, forCellWithReuseIdentifier: cellID)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! IconsCell
//        if let imageName = images?[indexPath.item] {
//            cell.imageView.image = UIImage(named: imageName)
//            cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: <#T##Selector?#>))
//        }
//        return cell
//    }
//
//    let cellImages: [UIImage]!
//    weak var delegate: AllImagesCellDelegate?
//
//    @objc func cellTapped(_ sender: Any) {
//
//        let aSender = sender as! TopSellerImagesCell.IconsCell
//        delegate?.goToDetailVC(cellImage: aSender.imageView.image!)
//
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 200, height: frame.height - 20)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
//    }
//
//    private class IconsCell: UICollectionViewCell {
//
//        let imageView: UIImageView = {
//            let iv = UIImageView()
//            iv.contentMode = .scaleAspectFit
//            iv.clipsToBounds = true
//            iv.layer.cornerRadius = 15
//            return iv
//        }()
//
//        override init(frame: CGRect) {
//            super.init(frame: frame)
//            setupViews()
//        }
//
//        func setupViews() {
//            addSubview(imageView)
//            imageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
//        }
//
//        required init?(coder aDecoder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
