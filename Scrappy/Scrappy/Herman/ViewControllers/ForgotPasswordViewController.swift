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
    
    let forgotPasswordInputViews = ForgotPasswordInputViews(frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurEffectView.frame = self.view.bounds
        view.addSubview(blurEffectView)
        view.addSubview(forgotPasswordInputViews)
        view.bringSubview(toFront: forgotPasswordInputViews)
        view.backgroundColor = UIColor.clear
        
        forgotPasswordInputViews.emailTextField.delegate = self
        
        forgotPasswordInputViews.closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        forgotPasswordInputViews.submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
    }
    
    let blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        return blurEffectView
    }()
    
    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func submitButtonTapped() {
        
        handleUserForgotPassword()
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailCheck = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        
        let alert = UIAlertController(title: "Email Sent!", message: nil, preferredStyle: .alert)
        let done = UIAlertAction(title: "Done", style: .default) { (_) in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(done)
        
        if emailCheck.evaluate(with: forgotPasswordInputViews.emailTextField.text) {
            present(alert, animated: true)
        } else {
            print("Email check didn't work")
        }
    }
    
    func handleUserForgotPassword() {
        
        guard let email = forgotPasswordInputViews.emailTextField.text, !email.isEmpty else { return }
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            
            if let error = error {
                print("Failed to send password reset", error)
                return
            }
        }
    }
}

extension ForgotPasswordViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        forgotPasswordInputViews.emailTextField.resignFirstResponder()
        return true
    }
}









