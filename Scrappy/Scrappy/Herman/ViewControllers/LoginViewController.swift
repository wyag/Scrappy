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
    
    let loginInputViews = LoginInputViews(frame: UIScreen.main.bounds)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(loginInputViews)
        
        loginInputViews.emailTextField.delegate = self
        loginInputViews.passwordTextField.delegate = self
        
        navigationController?.navigationBar.isHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide , object: nil)
        
        loginInputViews.forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        loginInputViews.signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        loginInputViews.createNewAccButton.addTarget(self, action: #selector(createNewAccButtonPressed), for: .touchUpInside)
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
    
    func handleUserLogIn() {
        
        guard let email = loginInputViews.emailTextField.text, !email.isEmpty else { return }
        guard let password = loginInputViews.passwordTextField.text, !password.isEmpty else { return }
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print("Failed to sign in with email", error)
                return
            }
            print("Successfully logged back in with user:", user?.uid ?? "")
        }
    }
    
    @objc func createNewAccButtonPressed() {
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        present(SignUpViewController(), animated: true, completion: nil)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        loginInputViews.emailTextField.resignFirstResponder()
        loginInputViews.passwordTextField.resignFirstResponder()
        return true
    }
}

