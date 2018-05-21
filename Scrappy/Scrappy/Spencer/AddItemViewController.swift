//
//  AddItemViewController.swift
//  Scrappy
//
//  Created by Spencer Cawley on 5/21/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    // Properties
    var itemImageButton: UIButton = {
       let imageButton = UIButton()
        imageButton.setImage(#imageLiteral(resourceName: "Donald Trump B-Day"), for: .normal)
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
    
    var itemTitle: UITextField = {
        let title = UITextField()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.placeholder = "Enter the title of the item..."
        title.backgroundColor = .lightGray
        title.borderStyle = .roundedRect
        return title
        
    }()
    
    var itemPrice: UITextField = {
        let price = UITextField()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.keyboardType = .numbersAndPunctuation
        price.placeholder = "Enter the price amount"
        price.backgroundColor = .lightGray
        price.borderStyle = .roundedRect
        return price
    }()
    
    var itemDescription: UITextView = {
        let des = UITextView()
        des.translatesAutoresizingMaskIntoConstraints = false
        des.backgroundColor = .lightGray
       return des
    }()
    
    var addItemButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.text = "Add Item"
        button.titleLabel?.textColor = .white
        button.backgroundColor = .blue
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "xMark"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        setupViews()
    }
    
    func setupViews() {
        
        // 'itemImage'
        view.addSubview(itemImageButton)
        itemImageButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        itemImageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        itemImageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        itemImageButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
        itemImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        // 'itemTitle'
        view.addSubview(itemTitle)
        itemTitle.widthAnchor.constraint(equalTo: itemImageButton.widthAnchor).isActive = true
        itemTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        itemTitle.centerXAnchor.constraint(equalTo: itemImageButton.centerXAnchor).isActive = true
        itemTitle.topAnchor.constraint(equalTo: itemImageButton.bottomAnchor, constant: 20).isActive = true
        
        // 'itemPrice'
        view.addSubview(itemPrice)
        itemPrice.widthAnchor.constraint(equalTo: itemImageButton.widthAnchor).isActive = true
        itemPrice.heightAnchor.constraint(equalToConstant: 20).isActive = true
        itemPrice.centerXAnchor.constraint(equalTo: itemImageButton.centerXAnchor).isActive = true
        itemPrice.topAnchor.constraint(equalTo: itemTitle.bottomAnchor, constant: 20).isActive = true
        
        // 'itemDescription'
        view.addSubview(itemDescription)
        itemDescription.widthAnchor.constraint(equalTo: itemImageButton.widthAnchor).isActive = true
        itemDescription.centerXAnchor.constraint(equalTo: itemImageButton.centerXAnchor).isActive = true
        itemDescription.topAnchor.constraint(equalTo: itemPrice.bottomAnchor, constant: 20).isActive = true
        itemDescription.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        
        // 'addItemButton'
        view.addSubview(addItemButton)
        addItemButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        addItemButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
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
        present(CollectionViewController(), animated: true, completion: nil)
    }
    
    // selector function for 'addItemButton'
    @objc func addItemButtonTapped() {
        
        guard let title = itemTitle.text, !title.isEmpty, let price = itemPrice.text, !price.isEmpty, let image = itemImageButton.imageView, itemImageButton.currentImage != nil else {
            
            let alert = UIAlertController(title: "Error Adding Item", message: "Please make sure item has an image, title and price", preferredStyle: .alert)
            
            let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
            
            alert.addAction(dismiss)
            present(alert, animated: true, completion: nil)
            return
            
        }
        print("success adding stuff!")
        // add to firebase
            
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














