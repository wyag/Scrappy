//
//  MessagesControllerTableViewCell.swift
//  Scrappy
//
//  Created by Herman Kwan on 6/1/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class MessagesControllerTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let profileImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 25
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let convoDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.lightGray
        label.text = "HH:MM:SS"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(profileImageView)
        profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(timeLabel)
        timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 18).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(usernameLabel)
        usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10).isActive = true
        usernameLabel.topAnchor.constraint(equalTo: timeLabel.topAnchor).isActive = true 
        usernameLabel.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor).isActive = true
    }

}
