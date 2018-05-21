//
//  UserPaymentCompleteInputViews.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/19/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class UserPaymentCompleteInputViews: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let popUpView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 12
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        return view
    }()
    
    let paymentReceivedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Payment Received!"
        label.textAlignment = .center
        return label
    }()
    
    let checkMarkImage: UIImageView = {
        let checkMark = UIImageView(image: #imageLiteral(resourceName: "checkMark"))
        checkMark.translatesAutoresizingMaskIntoConstraints = false
        checkMark.layer.cornerRadius = checkMark.frame.width / 30
        return checkMark
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(popUpView)
        popUpView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        popUpView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        popUpView.widthAnchor.constraint(equalToConstant: frame.width * 0.5).isActive = true
        popUpView.heightAnchor.constraint(equalToConstant: frame.height * 0.4).isActive = true
        
        popUpView.addSubview(paymentReceivedLabel)
        paymentReceivedLabel.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor).isActive = true
        paymentReceivedLabel.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 80).isActive = true
        paymentReceivedLabel.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor).isActive = true
        
        popUpView.addSubview(checkMarkImage)
        checkMarkImage.centerXAnchor.constraint(equalTo: popUpView.centerXAnchor).isActive = true
        checkMarkImage.topAnchor.constraint(equalTo: paymentReceivedLabel.bottomAnchor, constant: 30).isActive = true
        checkMarkImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        checkMarkImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
