//
//  UserPaymentInputViews.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/19/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class UserPaymentInputViews: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cardImageView: UIImageView = {
        let card = UIImageView(image: #imageLiteral(resourceName: "creditCard"))
        card.translatesAutoresizingMaskIntoConstraints = false
        card.layer.cornerRadius = 10
        return card
    }()
    
    let cardNumber: UILabel = {
        let cardNumber = UILabel()
        cardNumber.translatesAutoresizingMaskIntoConstraints = false
        cardNumber.textColor = UIColor.white
        return cardNumber
    }()
    
    let cardHolder: UILabel = {
        let cardHolder = UILabel()
        cardHolder.translatesAutoresizingMaskIntoConstraints = false
        cardHolder.textColor = UIColor.white
        return cardHolder
    }()
    
    let expDate: UILabel = {
        let expDate = UILabel()
        expDate.translatesAutoresizingMaskIntoConstraints = false
        expDate.textColor = UIColor.white
        return expDate
    }()
    
    let cvvNumber: UILabel = {
        let cvvNumber = UILabel()
        cvvNumber.translatesAutoresizingMaskIntoConstraints = false
        cvvNumber.textColor = UIColor.white
        return cvvNumber
    }()
    
    let cardNumberTextBox: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let cardNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Card Number"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let cardNumberTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        let leftView = UILabel(frame: CGRect(x: 0, y: 0, width: 13, height: 0))
        leftView.backgroundColor = UIColor.clear
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.keyboardType = .numberPad
        return textField
    }()
    let cardHolderTextBox: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let cardHolderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Card Holder's Name"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let cardHolderTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        let leftView = UILabel(frame: CGRect(x: 0, y: 0, width: 13, height: 0))
        leftView.backgroundColor = UIColor.clear
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.autocorrectionType = .no
        return textField
    }()
    let expDateTextBox: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let expDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Exp Date"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let expDateTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        let leftView = UILabel(frame: CGRect(x: 0, y: 0, width: 13, height: 0))
        leftView.backgroundColor = UIColor.clear
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.keyboardType = .numberPad
        return textField
    }()
    let cvvTextBox: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let cvvNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "CVV"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let cvvNumberTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        let leftView = UILabel(frame: CGRect(x: 0, y: 0, width: 13, height: 0))
        leftView.backgroundColor = UIColor.clear
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.autocorrectionType = .no
        return textField
    }()
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 47/255.0, green: 189/255.0, blue: 41/255.0, alpha: 1.0)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // CARD Image View
        addSubview(cardImageView)
        cardImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cardImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        cardImageView.widthAnchor.constraint(equalToConstant: frame.width * 0.8).isActive = true
        cardImageView.heightAnchor.constraint(equalToConstant: 170).isActive = true
        
        // Card Number
        cardImageView.addSubview(cardNumber)
        cardNumber.leadingAnchor.constraint(equalTo: cardImageView.leadingAnchor, constant: 10).isActive = true
        cardNumber.bottomAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: -35).isActive = true
        cardNumber.trailingAnchor.constraint(equalTo: cardImageView.trailingAnchor, constant: -60).isActive = true
        
        // Exp Date
        cardImageView.addSubview(expDate)
        expDate.leadingAnchor.constraint(equalTo: cardNumber.trailingAnchor, constant: 5).isActive = true
        expDate.bottomAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: -35).isActive = true
        expDate.trailingAnchor.constraint(equalTo: cardImageView.trailingAnchor, constant: -10).isActive = true
        
        // Card Holder
        cardImageView.addSubview(cardHolder)
        cardHolder.leadingAnchor.constraint(equalTo: cardImageView.leadingAnchor, constant: 10).isActive = true
        cardHolder.topAnchor.constraint(equalTo: cardNumber.bottomAnchor, constant: 5).isActive = true
        cardHolder.trailingAnchor.constraint(equalTo: cardImageView.trailingAnchor, constant: -20).isActive = true
        
        // Card Number View
        addSubview(cardNumberTextBox)
        cardNumberTextBox.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cardNumberTextBox.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 40).isActive = true
        cardNumberTextBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        cardNumberTextBox.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        cardNumberTextBox.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        cardNumberTextBox.addSubview(cardNumberLabel)
        cardNumberLabel.leadingAnchor.constraint(equalTo: cardNumberTextBox.leadingAnchor, constant: 13).isActive = true
        cardNumberLabel.topAnchor.constraint(equalTo: cardNumberTextBox.topAnchor, constant: 7).isActive = true
        cardNumberLabel.trailingAnchor.constraint(equalTo: cardNumberTextBox.trailingAnchor).isActive = true
        
        cardNumberTextBox.addSubview(cardNumberTextField)
        cardNumberTextField.leadingAnchor.constraint(equalTo: cardNumberTextBox.leadingAnchor).isActive = true
        cardNumberTextField.topAnchor.constraint(equalTo: cardNumberLabel.bottomAnchor, constant: 4).isActive = true
        cardNumberTextField.trailingAnchor.constraint(equalTo: cardNumberLabel.trailingAnchor).isActive = true
        
        // Card Holder View
        addSubview(cardHolderTextBox)
        cardHolderTextBox.leadingAnchor.constraint(equalTo: cardNumberTextBox.trailingAnchor, constant: 40).isActive = true
        cardHolderTextBox.topAnchor.constraint(equalTo: cardNumberTextBox.topAnchor).isActive = true
        cardHolderTextBox.widthAnchor.constraint(equalTo: cardNumberTextBox.widthAnchor).isActive = true
        cardHolderTextBox.heightAnchor.constraint(equalTo: cardNumberTextBox.heightAnchor).isActive = true
        
        cardHolderTextBox.addSubview(cardHolderLabel)
        cardHolderLabel.leadingAnchor.constraint(equalTo: cardHolderTextBox.leadingAnchor, constant: 13).isActive = true
        cardHolderLabel.topAnchor.constraint(equalTo: cardHolderTextBox.topAnchor, constant: 7).isActive = true
        cardHolderLabel.trailingAnchor.constraint(equalTo: cardHolderTextBox.trailingAnchor).isActive = true
        
        cardHolderTextBox.addSubview(cardHolderTextField)
        cardHolderTextField.leadingAnchor.constraint(equalTo: cardHolderTextBox.leadingAnchor).isActive = true
        cardHolderTextField.topAnchor.constraint(equalTo: cardHolderLabel.bottomAnchor, constant: 4).isActive = true
        cardHolderTextField.trailingAnchor.constraint(equalTo: cardHolderLabel.trailingAnchor).isActive = true
        
        // Exp Date View
        addSubview(expDateTextBox)
        expDateTextBox.leadingAnchor.constraint(equalTo: cardHolderTextBox.trailingAnchor, constant: 40).isActive = true
        expDateTextBox.topAnchor.constraint(equalTo: cardHolderTextBox.topAnchor).isActive = true
        expDateTextBox.widthAnchor.constraint(equalTo: cardHolderTextBox.widthAnchor).isActive = true
        expDateTextBox.heightAnchor.constraint(equalTo: cardHolderTextBox.heightAnchor).isActive = true
        
        expDateTextBox.addSubview(expDateLabel)
        expDateLabel.leadingAnchor.constraint(equalTo: expDateTextBox.leadingAnchor, constant: 13).isActive = true
        expDateLabel.topAnchor.constraint(equalTo: expDateTextBox.topAnchor, constant: 7).isActive = true
        expDateLabel.trailingAnchor.constraint(equalTo: expDateTextBox.trailingAnchor).isActive = true
        
        expDateTextBox.addSubview(expDateTextField)
        expDateTextField.leadingAnchor.constraint(equalTo: expDateTextBox.leadingAnchor).isActive = true
        expDateTextField.topAnchor.constraint(equalTo: expDateLabel.bottomAnchor, constant: 4).isActive = true
        expDateTextField.trailingAnchor.constraint(equalTo: expDateLabel.trailingAnchor).isActive = true
        
        // CVV View
        addSubview(cvvTextBox)
        cvvTextBox.leadingAnchor.constraint(equalTo: expDateTextBox.trailingAnchor, constant: 40).isActive = true
        cvvTextBox.topAnchor.constraint(equalTo: expDateTextBox.topAnchor).isActive = true
        cvvTextBox.widthAnchor.constraint(equalTo: expDateTextBox.widthAnchor).isActive = true
        cvvTextBox.heightAnchor.constraint(equalTo: expDateTextBox.heightAnchor).isActive = true
        
        // CVV View
        cvvTextBox.addSubview(cvvNumberLabel)
        cvvNumberLabel.leadingAnchor.constraint(equalTo: cvvTextBox.leadingAnchor, constant: 13).isActive = true
        cvvNumberLabel.topAnchor.constraint(equalTo: cvvTextBox.topAnchor, constant: 7).isActive = true
        cvvNumberLabel.trailingAnchor.constraint(equalTo: cvvTextBox.trailingAnchor).isActive = true
        
        cvvTextBox.addSubview(cvvNumberTextField)
        cvvNumberTextField.leadingAnchor.constraint(equalTo: cvvTextBox.leadingAnchor).isActive = true
        cvvNumberTextField.topAnchor.constraint(equalTo: cvvNumberLabel.bottomAnchor, constant: 4).isActive = true
        cvvNumberTextField.trailingAnchor.constraint(equalTo: cvvNumberLabel.trailingAnchor).isActive = true
        
        // Next Button
        addSubview(nextButton)
        nextButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -75).isActive = true
        nextButton.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
}
