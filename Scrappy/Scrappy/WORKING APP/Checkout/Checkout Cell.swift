//
//  CheckoutTableViewCell.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/23/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

protocol CheckoutTableViewCellDelegate: class {
    func delegateFunction(vcid: String)
}

class CheckoutTableViewCell: UITableViewCell {

    ///////////////////////////////////////////////// MARK: Local Cell Properties
    
    weak var delegate: CheckoutTableViewCellDelegate?
    
    let cardViewContainer = UIView()
    let cardLabel = UILabel()
    let cardImageView = UIImageView()
    let cardButton = UIButton()
    let cardCheckMarkImageView = UIImageView()
    var cardIsDone: Bool = true
    
    let addressViewContainer = UIView()
    let addressLabel = UILabel()
    let addressImageView = UIImageView()
    let adressButton = UIButton()
    var addressIsDone: Bool = true
    
    
    let orderViewContainer = UIView()
    let orderLabel = UILabel()
    
    
    ///////////////////////////////////////////////// MARK: SetupCellUI Function

    func setupCellUI(frame: CGRect) {
        
        self.backgroundColor = .white
        
        // 'cardViewContainer'
        cardViewContainer.frame = CGRect(x: 0, y: 0, width: frame.width, height: ((frame.height - 70)/3))
        cardViewContainer.backgroundColor = UIColor.white
        
        // 'cardLabel'
        let cardLabelAT = NSMutableAttributedString(string: "C a r d", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-DemiBold", size: 20) as Any])
        cardLabel.attributedText = cardLabelAT
        cardLabel.frame = CGRect(x: 20, y: 20, width: 0, height: 0)
        cardLabel.sizeToFit()
        
        // 'cardImageView'
        cardImageView.image = UIImage(named: "creditCard")
        cardImageView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        cardImageView.sizeToFit()
        cardImageView.center.x = (frame.width/2)
        cardImageView.center.y = 100
        
        // 'cardButton'
        cardButton.backgroundColor = UIColor.clear
        cardButton.frame = CGRect(x: 0, y: 0, width: cardImageView.frame.width + 10, height: cardImageView.frame.height + 10)
        cardButton.center.x = (frame.width/2 - 5)
        cardButton.center.y = 95
        cardButton.addTarget(self, action: #selector(self.goToCardDetail(_:)), for: .touchUpInside)
        cardButton.accessibilityIdentifier = "Card"
        
        // 'addressViewContainer'
        addressViewContainer.backgroundColor = UIColor.white
        addressViewContainer.frame = CGRect(x: 0, y: ((frame.height - 70)/3), width: frame.width, height: ((frame.height - 70)/3))
        
        // 'addressLabel'
        let addressLabelAT = NSMutableAttributedString(string: "A d d r e s s", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-DemiBold", size: 20) as Any])
        addressLabel.attributedText = addressLabelAT
        addressLabel.frame = CGRect(x: 20, y: 20, width: 0, height: 0)
        addressLabel.sizeToFit()
        
        // 'addressImageView'
        addressImageView.image = UIImage(named: "worldaddress")
        addressImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        addressImageView.center.x = frame.width/2
        addressImageView.center.y = (((frame.height - 70)/3)/2)
        
        // 'adressButton'
        adressButton.backgroundColor = .clear
        adressButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        adressButton.center.x = frame.width/2
        adressButton.center.y = (((frame.height - 70)/3)/2)
        adressButton.accessibilityIdentifier = "Address"
        adressButton.addTarget(self, action: #selector(self.goToCardDetail(_:)), for: .touchUpInside)
        adressButton.clipsToBounds = true
        
        // 'orderViewContainer'
        orderViewContainer.backgroundColor = UIColor.white
        orderViewContainer.frame = CGRect(x: 0, y: (((frame.height - 70)/3) * 2), width: frame.width, height: ((frame.height - 70)/3))
        
        // 'orderLabel'
        let orderLabelAT = NSMutableAttributedString(string: "O r d e r  S u m m a r y", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-DemiBold", size: 20) as Any])
        orderLabel.attributedText = orderLabelAT
        orderLabel.frame = CGRect(x: 20, y: 20, width: 0, height: 0)
        orderLabel.sizeToFit()
        
        
        self.addSubview(cardViewContainer)
        cardViewContainer.addSubview(cardLabel)
        cardViewContainer.addSubview(cardImageView)
        cardViewContainer.addSubview(cardButton)
        self.addSubview(addressViewContainer)
        addressViewContainer.addSubview(addressLabel)
        addressViewContainer.addSubview(addressImageView)
        addressViewContainer.addSubview(adressButton)
        self.addSubview(orderViewContainer)
        orderViewContainer.addSubview(orderLabel)
    }
    
    @objc func goToCardDetail(_ sender: UIButton) {
        guard let id = sender.accessibilityIdentifier else { return }
        
        if id == "Card" {
            if cardIsDone {
                cardIsDone = false
                cardImageView.layer.borderColor = UIColor.orange.cgColor
                cardImageView.layer.borderWidth = 3
                cardLabel.textColor = UIColor.orange
            } else {
                cardIsDone = true
                cardImageView.layer.borderColor = UIColor.clear.cgColor
                cardLabel.textColor = UIColor.white
            }
        } else if id == "Address" {
            if addressIsDone {
                addressImageView.image = UIImage(named: "highaddress")
                addressIsDone = false
                addressLabel.textColor = .yellow
            } else {
                addressImageView.image = UIImage(named: "worldaddress")
                addressIsDone = true
                addressLabel.textColor = .white
            }
        }
        

        delegate?.delegateFunction(vcid: id)
    }
    
    
    
    
    
}
