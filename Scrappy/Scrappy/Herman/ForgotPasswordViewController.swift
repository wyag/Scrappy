//
//  ForgotPasswordViewController.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/15/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import Firebase

class ForgotPasswordViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.clear
        setupBlurEffect()
        emailTextField.delegate = self
        setupViews()
    }
    
    func setupBlurEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.frame = self.view.bounds
        self.view.addSubview(blurEffectView)
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
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
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
        button.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func submitButtonTapped() {
        
        handleUserForgotPassword()
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailCheck = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        
        let alert = UIAlertController(title: "Email Sent!", message: nil, preferredStyle: .alert)
        let done = UIAlertAction(title: "Done", style: .default) { (_) in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(done)
        
        if emailCheck.evaluate(with: emailTextField.text) {
            present(alert, animated: true)
        } else {
            print("Email check didn't work")
        }
        
    }
    
    func handleUserForgotPassword() {
        
        guard let email = emailTextField.text, !email.isEmpty else { return }
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            
            if let error = error {
                print("Failed to send password reset", error)
                return
            }
        }
    }
    
    func setupViews() {
        
        view.addSubview(popUpView)
        popUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popUpView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        popUpView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        popUpView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.8).isActive = true
        
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
        submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        submitButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 150).isActive = true
        submitButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

extension ForgotPasswordViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        emailTextField.resignFirstResponder()
        return true
    }
}









