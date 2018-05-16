//
//  LoginViewController.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/14/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import Firebase
import SkyFloatingLabelTextField

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        navigationController?.navigationBar.isHidden = true
        setupViews()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide , object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height

            view.frame.origin.y += -(keyboardHeight)
        }
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height

            view.frame.origin.y += keyboardHeight
        }
    }
    
    let scrappyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SCRAPPY"
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
        button.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 0, height: 50)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        button.setTitle("SIGN IN", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = button.frame.height / 2
        button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let dontHaveAccLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Don't have an \naccount?"
        label.textAlignment = .center 
        label.numberOfLines = 2
        label.font = UIFont(name: "Avenir", size: 10)
        return label
    }()
    
    let createNewAccButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create new account", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 10)
        button.setTitleColor(UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(createNewAccButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func forgotPasswordButtonTapped() {
        
        let forgotPasswordVC = ForgotPasswordViewController()
        forgotPasswordVC.modalPresentationStyle = .overCurrentContext
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        present(forgotPasswordVC, animated: true, completion: nil)
    }
    
    @objc func signInButtonTapped() {
        
        handleUserLogIn()
    }
    
    @objc func createNewAccButtonPressed() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        present(SignupViewController(), animated: true, completion: nil)
    }
    
    func handleUserLogIn() {
        
        guard let email = emailTextField.text, !email.isEmpty else { return }
        guard let password = passwordTextField.text, !password.isEmpty else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if let error = error {
                print("Failed to sign in with email", error)
                return
            }
            
            print("Successfully logged back in with user:", user?.uid ?? "")
            
        }
    }
    
    func setupViews() {
        
        view.addSubview(scrappyLabel)
        scrappyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrappyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        scrappyLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        view.addSubview(textfieldStackView)
        textfieldStackView.addArrangedSubview(emailTextField)
        textfieldStackView.addArrangedSubview(passwordTextField)
        textfieldStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        textfieldStackView.topAnchor.constraint(equalTo: scrappyLabel.bottomAnchor, constant: 100).isActive = true
        textfieldStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        textfieldStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.addSubview(forgotPasswordButton)
        forgotPasswordButton.topAnchor.constraint(equalTo: textfieldStackView.bottomAnchor, constant: 5).isActive = true
        forgotPasswordButton.trailingAnchor.constraint(equalTo: textfieldStackView.trailingAnchor).isActive = true
        
        view.addSubview(signInButton)
        signInButton.leadingAnchor.constraint(equalTo: textfieldStackView.leadingAnchor).isActive = true
        signInButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 22).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: textfieldStackView.trailingAnchor).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(dontHaveAccLabel)
        dontHaveAccLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dontHaveAccLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 100).isActive = true
        dontHaveAccLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        view.addSubview(createNewAccButton)
        createNewAccButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createNewAccButton.topAnchor.constraint(equalTo: dontHaveAccLabel.bottomAnchor, constant: 1).isActive = true
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
}










