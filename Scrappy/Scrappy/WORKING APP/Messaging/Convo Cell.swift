//
//  ConvoTableViewCell.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/28/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

protocol ConvoTableViewCellDelegate: class {
    func goToMessage(_ sender: UIButton)
}

class ConvoTableViewCell: UITableViewCell {

    ////////////////////////////////////////////// MARK: Local Properties
    
    // Cell Delegate
    weak var delegate: ConvoTableViewCellDelegate?
    
    // View Container
    let messageContainerView = UIView()
    
    // Message Info
    let userProfileImageView = UIImageView()
    let userUsernameLabel = UILabel()
    let toMessageContainerView = UIView()
    let rightArrowImageView = UIImageView()
    let newMessageButton = UIButton()
    let goToMessageButton = UIButton()
    
    
    ////////////////////////////////////////////// MARK: Setup UI
    
    func setupCellUI(frame: CGRect) {
        
        // 'messageContainerView'
        messageContainerView.backgroundColor = UIColor.white
        messageContainerView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height - 10)
        
        // 'userProfileImageView'
        userProfileImageView.backgroundColor = UIColor.black
        userProfileImageView.frame.size = CGSize(width: 60, height: 60)
        userProfileImageView.center.y = messageContainerView.frame.height/2
        userProfileImageView.frame.origin.x = 40
        userProfileImageView.layer.cornerRadius = 30
        
        // 'userUsernameLabel'
        let userUsernameLabelAT = NSMutableAttributedString(string: "Username", attributes: [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Regular", size: 16) as Any])
        userUsernameLabel.attributedText = userUsernameLabelAT
        userUsernameLabel.frame = CGRect(x: userProfileImageView.frame.origin.x + 80, y: 0, width: 0, height: 0)
        userUsernameLabel.sizeToFit()
        userUsernameLabel.center.y = messageContainerView.frame.height/2
        
        // 'toMessageContainerView'
        toMessageContainerView.backgroundColor = UIColor.clear
        toMessageContainerView.frame = CGRect(x: frame.width - 120, y: 0, width: 80, height: 40)
        toMessageContainerView.center.y = messageContainerView.frame.height/2
        
        // 'rightArrowImageView'
        rightArrowImageView.backgroundColor = .clear
        rightArrowImageView.image = UIImage(named: "arrowright")
        rightArrowImageView.frame = CGRect(x: toMessageContainerView.frame.width, y: 0, width: 30, height: 30)
        rightArrowImageView.center.y = toMessageContainerView.frame.height/2
        
        // 'newMessageButton'
        let newMessageButtonAT = NSMutableAttributedString(string: "2", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        newMessageButton.setAttributedTitle(newMessageButtonAT, for: .normal)
        newMessageButton.setAttributedTitle(newMessageButtonAT, for: .highlighted)
        newMessageButton.setAttributedTitle(newMessageButtonAT, for: .selected)
        newMessageButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        newMessageButton.layer.cornerRadius = 15
        newMessageButton.backgroundColor = .red
        newMessageButton.center.x = toMessageContainerView.frame.width/2
        newMessageButton.center.y = toMessageContainerView.frame.height/2
        
        // 'goToMessageButton'
        goToMessageButton.frame = frame
        goToMessageButton.backgroundColor = UIColor.clear
        goToMessageButton.addTarget(self, action: #selector(self.goToMessageButtonTapped(_:)), for: .touchUpInside)
        
        self.addSubview(messageContainerView)
        messageContainerView.addSubview(userProfileImageView)
        messageContainerView.addSubview(userUsernameLabel)
        self.addSubview(toMessageContainerView)
        toMessageContainerView.addSubview(rightArrowImageView)
        toMessageContainerView.addSubview(newMessageButton)
        self.addSubview(goToMessageButton)
    }
    
    @objc func goToMessageButtonTapped(_ sender: UIButton) {
        print("Go To Message Button Tapped!!")
        delegate?.goToMessage(sender)
    }

}
