//
//  AddItemViewController.swift
//  Scrappy
//
//  Created by Spencer Cawley on 5/21/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import Firebase
import SkyFloatingLabelTextField

class AddItemViewController: UIViewController {
    
    // Properties
    let itemImageButton: UIButton = {
        let imageButton = UIButton()
//        imageButton.setBackgroundImage(#imageLiteral(resourceName: "addProfImage"), for: .normal)
//        imageButton.setBackgroundImage(#imageLiteral(resourceName: "addProfImageTapped"), for: .highlighted)
        imageButton.setImage(#imageLiteral(resourceName: "addProfImage"), for: .normal)
        imageButton.setBackgroundImage(#imageLiteral(resourceName: "addProfileBackground"), for: .highlighted)
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        imageButton.addTarget(self, action: #selector(itemImageButtonTapped), for: .touchUpInside)
        return imageButton
    }()
    
    // selector function for 'itemImageButton'
    @objc func itemImageButtonTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    var itemTitle: SkyFloatingLabelTextFieldWithIcon = {
        let title = SkyFloatingLabelTextFieldWithIcon()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textContentType = UITextContentType("")
        title.placeholder = "Title of Item"
        title.textColor = UIColor.black
        title.autocorrectionType = UITextAutocorrectionType.yes
        title.iconText = "\u{f303}"
        title.iconFont = UIFont(name: "Font Awesome 5 Free", size: 14)
        title.iconColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        title.titleColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        title.selectedTitleColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        title.lineColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 0.4)
        title.selectedLineColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        return title
    }()
    
    var itemPrice: SkyFloatingLabelTextFieldWithIcon = {
        let price = SkyFloatingLabelTextFieldWithIcon()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.textContentType = UITextContentType("")
        price.placeholder = "Price Amount"
        price.textColor = UIColor.black
        price.iconText = "\u{f155}"
        price.iconFont = UIFont(name: "Font Awesome 5 Free", size: 14)
        price.iconColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        price.keyboardType = .numberPad
        price.autocorrectionType = UITextAutocorrectionType.yes
        price.titleColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        price.selectedTitleColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        price.lineColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 0.4)
        price.selectedLineColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        return price
    }()
    
    let doneToolBar: UIToolbar = {
        let tb = UIToolbar()
        tb.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneToolBarTapped))
        tb.setItems([doneButton], animated: true)
        return tb
    }()
    
    @objc func doneToolBarTapped() {
        itemPrice.resignFirstResponder()
    }
    
    var itemDescription: UITextView = {
        let des = UITextView()
        des.translatesAutoresizingMaskIntoConstraints = false
        des.layer.borderWidth = 0.4
        des.layer.borderColor = UIColor.black.cgColor
        return des
    }()
    
    var addItemButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start Selling Item", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 250/255.0, green: 150/255.0, blue: 0, alpha: 1.0)
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "xMark"), for: .normal)
        return button
    }()
    
    var keyboardIsShown = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.orange
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide , object: nil)
        itemTitle.delegate = self
        itemPrice.delegate = self
        itemDescription.delegate = self
        setupViews()
        print(ItemController.shared.userSellingItems.count)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        if let keyboardFrame: NSValue = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            if keyboardIsShown == false {
                
                view.frame.origin.y += -(keyboardHeight)
                keyboardIsShown = true
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        
        if let keyboardFrame: NSValue = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            if keyboardIsShown == true {
                
                view.frame.origin.y = 0
                keyboardIsShown = false
            }
        }
    }
    
    func setupViews() {
        
        // 'itemImageButton'
        view.addSubview(itemImageButton)
        itemImageButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        itemImageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        itemImageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        itemImageButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
        itemImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        // 'itemTitle'
        view.addSubview(itemTitle)
        itemTitle.widthAnchor.constraint(equalTo: itemImageButton.widthAnchor).isActive = true
        itemTitle.heightAnchor.constraint(equalToConstant: 40).isActive = true
        itemTitle.centerXAnchor.constraint(equalTo: itemImageButton.centerXAnchor).isActive = true
        itemTitle.topAnchor.constraint(equalTo: itemImageButton.bottomAnchor, constant: 20).isActive = true
        
        // 'itemPrice'
        view.addSubview(itemPrice)
        itemPrice.widthAnchor.constraint(equalTo: itemImageButton.widthAnchor).isActive = true
        itemPrice.heightAnchor.constraint(equalToConstant: 40).isActive = true
        itemPrice.centerXAnchor.constraint(equalTo: itemImageButton.centerXAnchor).isActive = true
        itemPrice.topAnchor.constraint(equalTo: itemTitle.bottomAnchor, constant: 20).isActive = true
        itemPrice.inputAccessoryView = doneToolBar
        
        // 'itemDescription'
        view.addSubview(itemDescription)
        itemDescription.widthAnchor.constraint(equalTo: itemImageButton.widthAnchor).isActive = true
        itemDescription.centerXAnchor.constraint(equalTo: itemImageButton.centerXAnchor).isActive = true
        itemDescription.topAnchor.constraint(equalTo: itemPrice.bottomAnchor, constant: 20).isActive = true
        itemDescription.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        
        // 'addItemButton'
        view.addSubview(addItemButton)
//        addItemButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        addItemButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        addItemButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        addItemButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        addItemButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        addItemButton.centerXAnchor.constraint(equalTo: itemImageButton.centerXAnchor).isActive = true
        addItemButton.addTarget(self, action: #selector(addItemButtonTapped), for: .touchUpInside)
        
        // 'backButton'
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        backButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        backButton.setImage(#imageLiteral(resourceName: "xMark").withRenderingMode(.alwaysOriginal), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc func backButtonTapped() {
        print("back to collectionView tapped")
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    // selector function for 'addItemButton'
    @objc func addItemButtonTapped() {
        guard let currentTitle = itemTitle.text, !currentTitle.isEmpty, let currentDesc = itemDescription.text, !currentDesc.isEmpty, let currentPrice = itemPrice.text, !currentPrice.isEmpty, let currentPriceInt = Int(currentPrice), let currentImage = itemImageButton.currentImage, itemImageButton.currentImage != nil else {
            
            let alert = UIAlertController(title: "Error Adding Item", message: "Please make sure item has an image, title and price", preferredStyle: .alert)
            let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
            alert.addAction(dismiss)
            present(alert, animated: true, completion: nil)
            return
        }
        
        let item = Item(withTitle: currentTitle, description: currentDesc, image: currentImage, price: currentPriceInt)
        let userSellingItem = UserSellingItem(withTitle: currentPrice, description: currentDesc, image: currentImage, price: currentPriceInt)
        ItemController.shared.addUserSellingItems(item: userSellingItem)
        ItemController.shared.addAllSellingItems(item: item)
        show(CollectionViewController(), sender: self)
    }
}


// Mark: - Delegates
extension AddItemViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            itemImageButton.setImage(editedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            itemImageButton.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        dismiss(animated: true, completion: nil)
    }
}

extension AddItemViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        itemTitle.resignFirstResponder()
        itemPrice.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        itemTitle.resignFirstResponder()
        itemPrice.resignFirstResponder()
    }
}

extension AddItemViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            itemDescription.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        itemDescription.resignFirstResponder()
    }
}










