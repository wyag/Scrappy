//
//  CheckoutTableViewCell.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/23/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

protocol CheckoutTableViewCellDelegate: class {
    func delegateFunction()
}

class CheckoutTableViewCell: UITableViewCell {

    ///////////////////////////////////////////////// MARK: Local Cell Properties
    
    weak var delegate: CheckoutTableViewCellDelegate?
    
    let cardViewContainer = UIView()
    let cardLabel = UILabel()
    let cardImageView = UIImageView()
    let cardButton = UIButton()
    let cardCheckMarkImageView = UIImageView()
    
    let addressViewContainer = UIView()
    let addressLabel = UILabel()
    
    
    let orderViewContainer = UIView()
    let orderLabel = UILabel()
    
    
    ///////////////////////////////////////////////// MARK: SetupCellUI Function

    func setupCellUI(frame: CGRect) {
        
        self.backgroundColor = UIColor.black
        
        // 'cardViewContainer'
        cardViewContainer.frame = CGRect(x: 0, y: 0, width: frame.width, height: 200)
        cardViewContainer.backgroundColor = UIColor.black
        
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
        
        // 'addressViewContainer'
        addressViewContainer.backgroundColor = UIColor.black
        addressViewContainer.frame = CGRect(x: 0, y: 200, width: self.frame.width, height: 200)
        
        // 'addressLabel'
        let addressLabelAT = NSMutableAttributedString(string: "A d d r e s s", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-DemiBold", size: 20) as Any])
        addressLabel.attributedText = addressLabelAT
        addressLabel.frame = CGRect(x: 20, y: 20, width: 0, height: 0)
        addressLabel.sizeToFit()
        
        
        // 'orderViewContainer'
        orderViewContainer.backgroundColor = UIColor.black
        orderViewContainer.frame = CGRect(x: 0, y: 400, width: frame.width, height: 200)
        
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
        self.addSubview(orderViewContainer)
        orderViewContainer.addSubview(orderLabel)
    }
    
    @objc func goToCardDetail(_ sender: UIButton) {
        print("Card Button Tapped!!!")
        
        if cardViewContainer.backgroundColor == UIColor.black {
            cardViewContainer.backgroundColor = UIColor.green
            cardLabel.textColor = UIColor.black
        } else {
            cardViewContainer.backgroundColor = UIColor.black
            cardLabel.textColor = UIColor.white
        }
    }
    
    
    
    
    
}
