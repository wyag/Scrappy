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
import LocalAuthentication
import SVProgressHUD

class LoginViewController: UIViewController {
    
    let loginInputViews = LoginInputViews(frame: UIScreen.main.bounds)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true 
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(loginInputViews)
        
        loginInputViews.emailTextField.delegate = self
        loginInputViews.passwordTextField.delegate = self
        
        navigationController?.navigationBar.isHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide , object: nil)
        
        loginInputViews.forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        loginInputViews.signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        loginInputViews.createNewAccButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
        displayTouchID()
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
        SVProgressHUD.show(withStatus: "Logging In...")
        handleUserLogIn()
        SVProgressHUD.dismiss(withDelay: 0.5)
        
        loginInputViews.emailTextField.resignFirstResponder()
        loginInputViews.passwordTextField.resignFirstResponder()
    }
    
    func handleUserLogIn() {
        
        guard let email = loginInputViews.emailTextField.text, !email.isEmpty else { return }
        guard let password = loginInputViews.passwordTextField.text, !password.isEmpty else { return }
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                SVProgressHUD.showError(withStatus: "Error logging in. Please try again.")
                print("Failed to sign in with email", error)
                return
            }
            let rootNav = RootNavigationViewController()
            rootNav.viewControllers = [HomeViewController()]
            self.show(rootNav, sender: self)
            print("Successfully logged back in with user:", user?.uid ?? "")
        }
    }

    func displayTouchID() {
        let context: LAContext = LAContext()
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Use touchID to log in") { (success, error) in
                if let error = error {
                    print("Error logging in with touchID", error.localizedDescription)
                }
                
                if success {
                    print("Logged in")  
                }
            }
        }
    }
    
    @objc func signUpButtonTapped() {
        
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

