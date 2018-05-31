//
//  SellerPageCollectionViewCell.swift
//  Scrappy
//
//  Created by Spencer Cawley on 5/31/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class SellerPageCell: UICollectionViewCell {
    
    var sellersPostImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = #imageLiteral(resourceName: "kevinhart")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        addSubview(sellersPostImage)
        sellersPostImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        sellersPostImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        sellersPostImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        sellersPostImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
