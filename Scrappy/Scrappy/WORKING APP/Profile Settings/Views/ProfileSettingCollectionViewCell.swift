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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let image: UIImageView = {
        let some = UIImageView()
        some.translatesAutoresizingMaskIntoConstraints = false
        some.backgroundColor = UIColor.yellow
        return some
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.addSubview(image)
        image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: contentView.frame.height * 0.6).isActive = true
        image.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true 
    }
}





