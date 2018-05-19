//
//  SignUpViewController.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/14/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import Firebase
import SkyFloatingLabelTextField

class SignUpViewController: UIViewController {
    
    let signUpInputViews = SignUpInputViews(frame: UIScreen.main.bounds)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(signUpInputViews)
        
        view.backgroundColor = UIColor.white
        
        signUpInputViews.usernameTextField.delegate = self
        signUpInputViews.emailTextField.delegate = self
        signUpInputViews.passwordTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        signUpInputViews.closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        signUpInputViews.signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
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
    
    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func signUpButtonTapped() {
        handleUserSignUp()
        print("Sign Up Button Tapped")
    }
    
    func handleUserSignUp() {
        
        guard let username = signUpInputViews.usernameTextField.text else { return }
        guard let email = signUpInputViews.emailTextField.text, !email.isEmpty else { return }
        guard let password = signUpInputViews.passwordTextField.text, !password.isEmpty else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            if let error = error {
                print("Failed to create new user", error)
                return
            }
            
            print("Successfully created user:", user?.uid ?? "")
            
            let dictionaryValues = ["username": username, "email": email]
            guard let uid = user?.uid else { return }
            
            let values = [uid: dictionaryValues]
            
            Database.database().reference().child("users").updateChildValues(values, withCompletionBlock: { (error, reference) in
                
                if let error = error {
                    print("Failed to save user info into db", error)
                }
                
                print("Successfully saved user info into db")
    
            })
        }
    }
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        signUpInputViews.usernameTextField.resignFirstResponder()
        signUpInputViews.emailTextField.resignFirstResponder()
        signUpInputViews.passwordTextField.resignFirstResponder()
        return true
    }
}















