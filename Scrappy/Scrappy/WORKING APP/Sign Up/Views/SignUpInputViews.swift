//
//  SignUpInputViews.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/18/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class SignUpInputViews: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "xMark").withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: .normal)
        return button
    }()
    
    let createNewAccLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Create New \nAccount"
        label.numberOfLines = 2
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
    
    let usernameTextField: SkyFloatingLabelTextFieldWithIcon = {
        let name = SkyFloatingLabelTextFieldWithIcon()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.placeholder = "Username"
        name.textColor = UIColor.black
        name.autocorrectionType = UITextAutocorrectionType.no
        name.iconText = "\u{f007}"
        name.iconFont = UIFont(name: "Font Awesome 5 Free", size: 12)
        name.iconColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        name.selectedIconColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        name.titleColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        name.selectedTitleColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        name.lineColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 0.4)
        name.selectedLineColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        return name
    }()
    
    let emailTextField: SkyFloatingLabelTextFieldWithIcon = {
        let email = SkyFloatingLabelTextFieldWithIcon()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.placeholder = "Email Address"
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
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        password.textColor = UIColor.black
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
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 0, height: 50)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        button.setTitle("SIGN UP", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = button.frame.height / 2
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(closeButton)
        closeButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 13).isActive = true
        closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 13).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(createNewAccLabel)
        createNewAccLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        createNewAccLabel.topAnchor.constraint(equalTo: topAnchor, constant: 80).isActive = true
        createNewAccLabel.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        
        addSubview(textfieldStackView)
        textfieldStackView.addArrangedSubview(usernameTextField)
        textfieldStackView.addArrangedSubview(emailTextField)
        textfieldStackView.addArrangedSubview(passwordTextField)
        textfieldStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        textfieldStackView.topAnchor.constraint(equalTo: createNewAccLabel.bottomAnchor, constant: 100).isActive = true
        textfieldStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        textfieldStackView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        addSubview(signUpButton)
        signUpButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

