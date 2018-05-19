//
//  UserPaymentViewController.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/17/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class UserPaymentViewController: UIViewController {
    
    let userPaymentInputViews = UserPaymentInputViews(frame: UIScreen.main.bounds)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(userPaymentInputViews)
        
        userPaymentInputViews.cardNumberTextField.delegate = self
        userPaymentInputViews.cardHolderTextField.delegate = self
        userPaymentInputViews.expDateTextField.delegate = self
        userPaymentInputViews.cvvNumberTextField.delegate = self
        
        view.backgroundColor = UIColor.lightGray
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        userPaymentInputViews.cardNumberTextField.addTarget(self, action: #selector(cardNumberTextChanged), for: .touchUpInside)
        userPaymentInputViews.cardHolderTextField.addTarget(self, action: #selector(cardHolderTextChanged), for: .touchUpInside)
        userPaymentInputViews.expDateTextField.addTarget(self, action: #selector(expDateTextChanged), for: .touchUpInside)
        userPaymentInputViews.cvvNumberTextField.addTarget(self, action: #selector(cvvTextChanged), for: .touchUpInside)
        
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        if let keyboardFrame: NSValue = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as? NSValue {
            
            UIView.animate(withDuration: 0.5) {
                let keyboardRectangle = keyboardFrame.cgRectValue
                let keyboardHeight = keyboardRectangle.height
        
                self.userPaymentInputViews.nextButton.transform = CGAffineTransform(translationX: 0, y: -(keyboardHeight - 75))
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        
        if let keyboardFrame: NSValue = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as? NSValue {
            
            UIView.animate(withDuration: 0.5) {
                let keyboardRectangle = keyboardFrame.cgRectValue
                let keyboardHeight = keyboardRectangle.height

                self.userPaymentInputViews.nextButton.transform = CGAffineTransform(translationX: 0, y: keyboardHeight - 75)
            }
        }
    }
    
    @objc func cardNumberTextChanged() {
        
        guard let text = userPaymentInputViews.cardNumberTextField.text else { return }
        userPaymentInputViews.cardNumber.text = text
    }
    
    @objc func cardHolderTextChanged() {
        
        guard let text = userPaymentInputViews.cardHolderTextField.text else { return }
        userPaymentInputViews.cardHolder.text = text
    }
    
    @objc func expDateTextChanged() {
        
        guard let text = userPaymentInputViews.expDateTextField.text else { return }
        userPaymentInputViews.expDate.text = text
    }
    
    @objc func cvvTextChanged() {
        
//        guard let text = cvvNumberTextField.text else { return }
//        cvvNumberLabel.text = text 
    }
    
    
    
    @objc func nextButtonTapped() {
        
//        cardNumberTextField.resignFirstResponder()
//        cardHolderTextField.resignFirstResponder()
//        expDateTextField.resignFirstResponder()
//        cvvNumberTextField.resignFirstResponder()
        
        switch self.userPaymentInputViews.cardNumberTextBox.frame.origin.x {
        case 20.0:
            
            UIView.animate(withDuration: 0.4) {
                self.userPaymentInputViews.cardHolderTextBox.transform = CGAffineTransform(translationX: -(self.view.frame.width), y: 0)
                self.userPaymentInputViews.cardNumberTextBox.transform = CGAffineTransform(translationX: -(self.view.frame.width), y: 0)
            }
            
        case -(self.view.frame.width - 20):
            
            UIView.animate(withDuration: 0.35) {
                self.userPaymentInputViews.expDateTextBox.transform = CGAffineTransform(translationX: -(self.view.frame.width * 2), y: 0)
                self.userPaymentInputViews.cardHolderTextBox.transform = CGAffineTransform(translationX: -(self.view.frame.width * 2), y: 0)
                self.userPaymentInputViews.cardNumberTextBox.transform = CGAffineTransform(translationX: -(self.view.frame.width * 2), y: 0)
            }
            
        case -(self.view.frame.width * 2 - 20):
            
            UIView.animate(withDuration: 0.3) {
                self.userPaymentInputViews.cvvTextBox.transform = CGAffineTransform(translationX: -(self.view.frame.width * 3), y: 0)
                self.userPaymentInputViews.expDateTextBox.transform = CGAffineTransform(translationX: -(self.view.frame.width * 3), y: 0)
                self.userPaymentInputViews.cardHolderTextBox.transform = CGAffineTransform(translationX: -(self.view.frame.width * 3), y: 0)
                self.userPaymentInputViews.cardNumberTextBox.transform = CGAffineTransform(translationX: -(self.view.frame.width * 3), y: 0)
            }
            
        case -(self.view.frame.width * 3 - 20):
            
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
            
            let userPaymentCompleteVC = UserPaymentCompleteViewController()
            userPaymentCompleteVC.modalPresentationStyle = .overCurrentContext
            present(userPaymentCompleteVC, animated: true, completion: nil)
            
        default:
            return
        }
    }
}

extension UserPaymentViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        userPaymentInputViews.cardNumberTextField.resignFirstResponder()
        userPaymentInputViews.cardHolderTextField.resignFirstResponder()
        userPaymentInputViews.expDateTextField.resignFirstResponder()
        userPaymentInputViews.cvvNumberTextField.resignFirstResponder()
        return true 
    }
}





