//
//  ForgotPasswordInputViews.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/18/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class ForgotPasswordInputViews: UIView {
    
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
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "xMark").withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: .normal)
        return button
    }()
    
    let emailTextField: UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.placeholder = "Enter Email Here"
        email.layer.borderColor = UIColor.lightGray.cgColor
        email.layer.borderWidth = 0.4
        let leftView = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        leftView.backgroundColor = UIColor.clear
        email.leftView = leftView
        email.leftViewMode = .always
        return email
    }()
    
    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(popUpView)
        popUpView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        popUpView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        popUpView.widthAnchor.constraint(equalToConstant: frame.width * 0.8).isActive = true
        popUpView.heightAnchor.constraint(equalToConstant: frame.height * 0.8).isActive = true
        
        popUpView.addSubview(closeButton)
        closeButton.leadingAnchor.constraint(equalTo: popUpView.safeAreaLayoutGuide.leadingAnchor, constant: 13).isActive = true
        closeButton.topAnchor.constraint(equalTo: popUpView.safeAreaLayoutGuide.topAnchor, constant: 13).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        popUpView.addSubview(emailTextField)
        emailTextField.centerXAnchor.constraint(equalTo: popUpView.centerXAnchor).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor, constant: 25).isActive = true
        emailTextField.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 130).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor, constant: -25).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        popUpView.addSubview(submitButton)
        submitButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        submitButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 150).isActive = true
        submitButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
}
