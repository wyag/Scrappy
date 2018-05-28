//
//  AllImagesCell.swift
//  Scrappy
//
//  Created by Spencer Cawley on 5/15/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class BottomImagesCell: UICollectionViewCell {
    
//    var raitingStackView = UIStackView()
//    var raitingButtons = [UIButton()]
    var itemRaiting = 3
    var images: UIImage?
    
    var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 15
        return iv
    }()
    
    var cellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "test"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.black
        return label
    }()
    
    var priceLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "$100"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor.black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let view = UIView(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        addSubview(cellLabel)
        cellLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        cellLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        cellLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        cellLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        
        addSubview(priceLabel)
        priceLabel.topAnchor.constraint(equalTo: cellLabel.bottomAnchor, constant: 5).isActive = true
        priceLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
//        setupRaitingStackView()
    }
    
//    func setupRaitingStackView() {
//
//        addSubview(raitingStackView)
//        raitingStackView.translatesAutoresizingMaskIntoConstraints = false
//        raitingStackView.axis = .horizontal
//        raitingStackView.distribution = .fillEqually
//        raitingStackView.bottomAnchor.constraint(equalTo: cellLabel.topAnchor).isActive = true
//        raitingStackView.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        raitingStackView.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        raitingStackView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
//
//        for _ in 0..<5 {
//            let starButton = UIButton()
//            starButton.setImage(#imageLiteral(resourceName: "emptyStar"), for: .normal)
//            starButton.setImage(#imageLiteral(resourceName: "fullStar"), for: .selected)
//            starButton.translatesAutoresizingMaskIntoConstraints = false
//            raitingStackView.addArrangedSubview(starButton)
//            raitingButtons.append(starButton)
//        }
//        if itemRaiting == 1 {
//            raitingButtons[1].isSelected = true
//        }
//
//        if itemRaiting == 2 {
//            raitingButtons[1].isSelected = true
//            raitingButtons[2].isSelected = true
//        }
//
//        if itemRaiting == 3 {
//            raitingButtons[1].isSelected = true
//            raitingButtons[2].isSelected = true
//            raitingButtons[3].isSelected = true
//        }
//
//        if itemRaiting == 4 {
//            raitingButtons[1].isSelected = true
//            raitingButtons[2].isSelected = true
//            raitingButtons[3].isSelected = true
//            raitingButtons[4].isSelected = true
//        }
//
//        if itemRaiting == 5 {
//            raitingButtons[1].isSelected = true
//            raitingButtons[2].isSelected = true
//            raitingButtons[3].isSelected = true
//            raitingButtons[4].isSelected = true
//            raitingButtons[5].isSelected = true
//        }
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
