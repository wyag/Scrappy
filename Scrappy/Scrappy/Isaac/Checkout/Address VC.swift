//
//  AddressViewController.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/24/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {

    //////////////////////////////////////////////////////// MARK: Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    //////////////////////////////////////////////////////// MARK: Local Properties
    
    let addressHeaderLabel = UILabel()
    
    let streetLabel = UILabel()
    let streetTextField = UITextField()
    
    let cityLabel = UILabel()
    let cityTextField = UITextField()
    
    let stateLabel = UILabel()
    let stateTextField = UITextField()
    
    let zipLabel = UILabel()
    let zipTextField = UITextField()
    
    let switchLabel = UILabel()
    let billingAddressSwitch = UISwitch()
    
    let billingAddressHeaderLabel = UILabel()
    
    let billStreetLabel = UILabel()
    let billStreetTextField = UITextField()
    
    let billCityLabel = UILabel()
    let billCityTextField = UITextField()
    
    let billStateLabel = UILabel()
    let billStateTextField = UITextField()
    
    let billZipLabel = UILabel()
    let billZipTextField = UITextField()
    
    let doneButton = UIButton()
    let cancelButton = UIButton()

    ///////////////////////////////////////////////////////////////// MARK: Setup UI
    
    func setupUI() {
        
        // Main View
        self.view.backgroundColor = .white
        
        // 'addressHeaderLabel'
        let addressHeaderLabelAT = NSMutableAttributedString(string: "Enter Mailing Address :", attributes: [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Regular", size: 24) as Any])
        addressHeaderLabel.attributedText = addressHeaderLabelAT
        addressHeaderLabel.frame = CGRect(x: 0, y: 40, width: 0, height: 0)
        addressHeaderLabel.sizeToFit()
        addressHeaderLabel.center.x = self.view.center.x
        
        // 'streetLabel'
        let streetLabelAT = NSMutableAttributedString(string: "Street :", attributes: [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        streetLabel.attributedText = streetLabelAT
        streetLabel.frame = CGRect(x: 40, y: 100, width: 0, height: 0)
        streetLabel.sizeToFit()
        
        // 'streetTextField'
        streetTextField.backgroundColor = UIColor.white
        streetTextField.layer.borderColor = UIColor.black.cgColor
        streetTextField.layer.borderWidth = 1
        streetTextField.layer.cornerRadius = 12
        streetTextField.textColor = .black
        streetTextField.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        streetTextField.center.x = self.view.center.x
        streetTextField.center.y = streetLabel.center.y
        
        
        // 'cityLabel'
        let cityLabelAT = NSMutableAttributedString(string: "City :", attributes: [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        cityLabel.attributedText = cityLabelAT
        cityLabel.frame = CGRect(x: 40, y: 160, width: 0, height: 0)
        cityLabel.sizeToFit()
        
        // 'cityTextField'
        cityTextField.backgroundColor = UIColor.clear
        cityTextField.layer.borderWidth = 1
        cityTextField.layer.borderColor = UIColor.black.cgColor
        cityTextField.layer.cornerRadius = 12
        cityTextField.textColor = .black
        cityTextField.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        cityTextField.center.x = self.view.center.x
        cityTextField.center.y = cityLabel.center.y
        
        
        // 'stateLabel'
        let stateLabelAT = NSMutableAttributedString(string: "State :", attributes: [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        stateLabel.attributedText = stateLabelAT
        stateLabel.frame = CGRect(x: 40, y: 220, width: 0, height: 0)
        stateLabel.sizeToFit()
        
        // 'stateTextField'
        stateTextField.backgroundColor = UIColor.clear
        stateTextField.layer.borderWidth = 1
        stateTextField.layer.borderColor = UIColor.black.cgColor
        stateTextField.layer.cornerRadius = 12
        stateTextField.textColor = .black
        stateTextField.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        stateTextField.center.x = self.view.center.x
        stateTextField.center.y = stateLabel.center.y
        
        
        // 'zipLabel'
        let zipLabelAT = NSMutableAttributedString(string: "Zip :", attributes: [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        zipLabel.attributedText = zipLabelAT
        zipLabel.frame = CGRect(x: 40, y: 280, width: 0, height: 0)
        zipLabel.sizeToFit()
        
        // 'zipTextField'
        zipTextField.backgroundColor = UIColor.clear
        zipTextField.layer.borderColor = UIColor.black.cgColor
        zipTextField.layer.borderWidth = 1
        zipTextField.layer.cornerRadius = 12
        zipTextField.textColor = UIColor.black
        zipTextField.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        zipTextField.center.x = self.view.center.x
        zipTextField.center.y = zipLabel.center.y
        
        
        // 'doneButton'
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitle("Done", for: .highlighted)
        doneButton.setTitle("Done", for: .selected)
        doneButton.setTitleColor(.black, for: .normal)
        doneButton.setTitleColor(.black, for: .highlighted)
        doneButton.setTitleColor(.black, for: .selected)
        doneButton.layer.borderColor = UIColor.green.cgColor
        doneButton.layer.borderWidth = 2
        doneButton.layer.cornerRadius = 12
        doneButton.backgroundColor = UIColor.clear
        doneButton.frame = CGRect(x: 40, y: self.view.frame.height - 60, width: 120, height: 30)
        doneButton.addTarget(self, action: #selector(self.dismissCurrentVC(_:)), for: .touchUpInside)
        
        // 'cancelButton'
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitle("Cancel", for: .highlighted)
        cancelButton.setTitle("Cancel", for: .selected)
        cancelButton.setTitleColor(.black, for: .normal)
        cancelButton.setTitleColor(.black, for: .highlighted)
        cancelButton.setTitleColor(.black, for: .selected)
        cancelButton.layer.borderWidth = 2
        cancelButton.layer.borderColor = UIColor.red.cgColor
        cancelButton.layer.cornerRadius = 12
        cancelButton.backgroundColor = .clear
        cancelButton.frame = CGRect(x: self.view.frame.width - 160, y: self.view.frame.height - 60, width: 120, height: 30)
        cancelButton.addTarget(self, action: #selector(self.dismissCurrentVC(_:)), for: .touchUpInside)
        
        
        // 'switchLabel'
        let switchLabelAT = NSMutableAttributedString(string: "Same As Mailing Address :", attributes: [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        switchLabel.attributedText = switchLabelAT
        switchLabel.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        switchLabel.sizeToFit()
        switchLabel.center.x = self.view.center.x
        switchLabel.center.y = self.view.center.y
        
        
        self.view.addSubview(addressHeaderLabel)
        self.view.addSubview(streetLabel)
        self.view.addSubview(streetTextField)
        self.view.addSubview(cityLabel)
        self.view.addSubview(cityTextField)
        self.view.addSubview(stateLabel)
        self.view.addSubview(stateTextField)
        self.view.addSubview(zipLabel)
        self.view.addSubview(zipTextField)
        self.view.addSubview(doneButton)
        self.view.addSubview(cancelButton)
        self.view.addSubview(switchLabel)
    }
    
    
    
    
    ///////////////////////////////////////////////////////////////// MARK: Setup Billing UI
    
    func setupBillingUI() {
        
        // 'billingAddressHeaderLabel'
        let billingAddressHeaderLabelAT = NSMutableAttributedString(string: "Enter Billing Address :", attributes: [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Regular", size: 22) as Any])
        billingAddressHeaderLabel.attributedText = billingAddressHeaderLabelAT
        billingAddressHeaderLabel.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        billingAddressHeaderLabel.sizeToFit()
        billingAddressHeaderLabel.center.x = self.view.center.x
        billingAddressHeaderLabel.center.y = self.view.center.y
        
        
        
        self.view.addSubview(billingAddressHeaderLabel)
    }
    
    
    
    @objc func dismissCurrentVC(_ sender: UIButton) {
        
        print("Dismiss Current VC!!!")
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    

}
