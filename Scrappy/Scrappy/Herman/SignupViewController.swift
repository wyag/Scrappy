//
//  SignupViewController.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/14/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class SignupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupViews()
    }
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "xMark").withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
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
    
    let fullNameTextField: SkyFloatingLabelTextFieldWithIcon = {
        let name = SkyFloatingLabelTextFieldWithIcon()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.placeholder = "First Name"
        name.textColor = UIColor.lightGray
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
        email.textColor = UIColor.lightGray
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
        password.textColor = UIColor.lightGray
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
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func signUpButtonTapped() {
        print("Sign Up Button Tapped")
    }
    
    func setupViews() {
        
        view.addSubview(closeButton)
        closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 13).isActive = true
        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 13).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        view.addSubview(createNewAccLabel)
        createNewAccLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createNewAccLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        createNewAccLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        view.addSubview(textfieldStackView)
        textfieldStackView.addArrangedSubview(fullNameTextField)
        textfieldStackView.addArrangedSubview(emailTextField)
        textfieldStackView.addArrangedSubview(passwordTextField)
        textfieldStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        textfieldStackView.topAnchor.constraint(equalTo: createNewAccLabel.bottomAnchor, constant: 100).isActive = true
        textfieldStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        textfieldStackView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        view.addSubview(signUpButton)
        signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true 
        signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}




