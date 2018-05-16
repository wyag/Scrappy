
//  TopSellerImageCell.swift
//  Scrappy
//
//  Created by Spencer Cawley on 5/15/18.
//  Copyright © 2018 Isaac. All rights reserved.


import UIKit

class TopSellerImagesCell: UICollectionViewCell {

    let cellID = "cellID"
    var images: String? {
        didSet {
            if let imageName = images {
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 15
        return iv
    }()

    let cellLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor.black
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        

//        cellLabelConstraints()
    }

//    func cellLabelConstraints() {
//        addSubview(cellLabel)
////        cellLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10)
//        cellLabel.widthAnchor.constraint(equalToConstant: 30)
//        cellLabel.heightAnchor.constraint(equalToConstant: 30)
//        cellLabel.backgroundColor = .black

//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! IconsCell
//        if let imageName = images?[indexPath.item] {
//            cell.imageView.image = UIImage(named: imageName)
//        }
//        return cell
//    }


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
}

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
//    let cellLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.boldSystemFont(ofSize: 12)
//        label.textColor = UIColor.black
//        return label
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//        //        isUserInteractionEnabled = false
//    }
//
//    func setupViews() {
//        addSubview(collectionView)
//        collectionView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(IconsCell.self, forCellWithReuseIdentifier: cellID)
//
//        cellLabelConstraints()
//    }
//
//    func cellLabelConstraints() {
//        addSubview(cellLabel)
//        //        cellLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10)
//        cellLabel.widthAnchor.constraint(equalToConstant: 30)
//        cellLabel.heightAnchor.constraint(equalToConstant: 30)
//        cellLabel.backgroundColor = .black
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
//        }
//        return cell
//    }
//
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
//
//
//
//
//
//
//
