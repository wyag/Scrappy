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
import SVProgressHUD

class SignUpViewController: UIViewController {
    
    let signUpInputViews = SignUpInputViews(frame: UIScreen.main.bounds)
    var keyboardIsShown = false

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
        signUpInputViews.plusPhotoButton.addTarget(self, action: #selector(handlePlusPhoto), for: .touchUpInside)
    }
    
    @objc func handlePlusPhoto() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            if keyboardIsShown == false {
                
                view.frame.origin.y += -(keyboardHeight / 3)
                keyboardIsShown = true
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
            
            if keyboardIsShown == true {
                
                view.frame.origin.y = 0
                
        }
    }
    
    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func signUpButtonTapped() {
        SVProgressHUD.setForegroundColor(Constants.orangeColor)
        SVProgressHUD.show(withStatus: "Signing Up...")
        handleUserSignUp()
        
    }
    
    func handleUserSignUp() {
        
        guard let profileImage = signUpInputViews.plusPhotoButton.currentBackgroundImage, profileImage != #imageLiteral(resourceName: "addPhoto") else { SVProgressHUD.showError(withStatus: "Please create a profile image"); return }
        guard let username = signUpInputViews.usernameTextField.text, !username.isEmpty else { SVProgressHUD.showError(withStatus: "Please Enter a username"); return }
        guard let email = signUpInputViews.emailTextField.text, !email.isEmpty else { SVProgressHUD.showError(withStatus: "Please Enter an email"); return }
        guard let password = signUpInputViews.passwordTextField.text, password.count >= 6 else { SVProgressHUD.showError(withStatus: "Please Enter a password with at least 6 characters"); return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            if let error = error {
                print("Failed to create new user", error)
                return
            }
            
            print("Successfully created user:", user?.uid ?? "")
            
            guard let uploadData = UIImageJPEGRepresentation(profileImage, 0.3) else { return }
            let imageUID = UUID().uuidString
            
            Storage.storage().reference().child("profileImages").child(imageUID).putData(uploadData, metadata: nil) { (metadata, error) in
                
                if let error = error {
                    print("❌Error storing profile image to Storage. *Check handleUserSignUp()", error)
                }
                
                guard let imageURL = metadata?.downloadURL()?.absoluteString else { return }
                guard let uid = user?.uid else { return }
                let dictionaryValues = ["username": username, "email": email, "profileImage": imageURL]
                
                let values = [uid: dictionaryValues]
                
                Database.database().reference().child("users").updateChildValues(values, withCompletionBlock: { (error, reference) in
                    
                    if let error = error {
                        print("Failed to save user info into db", error)
                    }
                    
                    print("Successfully saved user info into db")
                    SVProgressHUD.dismiss()
                    self.dismiss(animated: true, completion: nil)

                })
            }
        }
    }
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        signUpInputViews.usernameTextField.resignFirstResponder()
        signUpInputViews.emailTextField.resignFirstResponder()
        signUpInputViews.passwordTextField.resignFirstResponder()
        keyboardIsShown = false 
        return true
    }
}

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            self.signUpInputViews.plusPhotoButton.setBackgroundImage(editedImage, for: .normal)
            
            
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            self.signUpInputViews.plusPhotoButton.setBackgroundImage(originalImage, for: .normal)
        }
        dismiss(animated: true, completion: nil)
    }
}
















