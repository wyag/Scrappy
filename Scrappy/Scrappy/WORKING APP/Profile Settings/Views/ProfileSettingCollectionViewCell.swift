//
//  ProfileSettingCollectionViewCell.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/16/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class ProfileSettingCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let image: UIImageView = {
        let some = UIImageView()
        some.translatesAutoresizingMaskIntoConstraints = false
        some.backgroundColor = UIColor.yellow
        some.contentMode = .scaleAspectFill
        some.layer.cornerRadius = 8
        some.clipsToBounds = true 
        return some
    }()
    
    let itemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.orangeColor
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.addSubview(image)
        image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        image.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: contentView.frame.height * 0.8).isActive = true
        image.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        
        contentView.addSubview(itemLabel)
        itemLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        itemLabel.topAnchor.constraint(equalTo: image.bottomAnchor).isActive = true
        itemLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        itemLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true 
    }
}





