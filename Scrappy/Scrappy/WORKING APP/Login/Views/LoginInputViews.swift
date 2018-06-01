//
//  LoginInputViews.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/18/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class LoginInputViews: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let scrappyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SCRAPPI"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        label.textAlignment = .center
        return label
    }()
    
    let textfieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    let emailTextField: SkyFloatingLabelTextFieldWithIcon = {
        let email = SkyFloatingLabelTextFieldWithIcon()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.textContentType = UITextContentType("")
        email.placeholder = "Email"
        email.textColor = UIColor.black
        email.autocorrectionType = UITextAutocorrectionType.no
        email.iconText = "\u{f0e0}"
        email.iconFont = UIFont(name: "Font Awesome 5 Free", size: 12)
        email.iconColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        email.selectedIconColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        email.titleColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        email.selectedTitleColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        email.lineColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 0.4)
        email.selectedLineColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        return email
    }()
    
    let passwordTextField: SkyFloatingLabelTextFieldWithIcon = {
        let password = SkyFloatingLabelTextFieldWithIcon()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.textContentType = UITextContentType("")
        password.placeholder = "Password"
        password.textColor = UIColor.black
        password.isSecureTextEntry = true
        password.iconText = "\u{f023}"
        password.iconFont = UIFont(name: "Font Awesome 5 Free", size: 12)
        password.iconColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        password.selectedIconColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        password.titleColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        password.selectedTitleColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        password.lineColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 0.4)
        password.selectedLineColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        return password
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forgot password?", for: .normal)
        button.setTitleColor(UIColor(red: 26/255.0, green: 26/255.0, blue: 26/255.0, alpha: 1.0), for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 10)
        return button
    }()
    
    let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 0, height: 50)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Constants.orangeColor
        button.alpha = 0.3
        button.setTitle("SIGN IN", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = button.frame.height / 2
        button.isEnabled = false
        return button
    }()
    
    let dontHaveAccLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Don't have an \naccount?"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Avenir", size: 13)
        return label
    }()
    
    let createNewAccButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create new account", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 13)
        button.setTitleColor(UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0), for: .normal)
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(scrappyLabel)
        scrappyLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        scrappyLabel.topAnchor.constraint(equalTo: topAnchor, constant: 150).isActive = true
        scrappyLabel.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        
        addSubview(textfieldStackView)
        textfieldStackView.addArrangedSubview(emailTextField)
        textfieldStackView.addArrangedSubview(passwordTextField)
        textfieldStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        textfieldStackView.topAnchor.constraint(equalTo: scrappyLabel.bottomAnchor, constant: 100).isActive = true
        textfieldStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        textfieldStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(forgotPasswordButton)
        forgotPasswordButton.topAnchor.constraint(equalTo: textfieldStackView.bottomAnchor, constant: 5).isActive = true
        forgotPasswordButton.trailingAnchor.constraint(equalTo: textfieldStackView.trailingAnchor).isActive = true
        
        addSubview(signInButton)
        signInButton.leadingAnchor.constraint(equalTo: textfieldStackView.leadingAnchor).isActive = true
        signInButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 22).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: textfieldStackView.trailingAnchor).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(createNewAccButton)
        createNewAccButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        createNewAccButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        addSubview(dontHaveAccLabel)
        dontHaveAccLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        dontHaveAccLabel.bottomAnchor.constraint(equalTo: createNewAccButton.topAnchor, constant: -5).isActive = true
        dontHaveAccLabel.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
    }
}

