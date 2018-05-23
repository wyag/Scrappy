//
//  AddItemViewController.swift
//  Scrappy
//
//  Created by Spencer Cawley on 5/21/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import Firebase

class AddItemViewController: UIViewController {
    
    // Properties
    let itemImageButton: UIButton = {
        let imageButton = UIButton()
        imageButton.setImage(#imageLiteral(resourceName: "addProfImage"), for: .normal)
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
        button.setTitle("Add Item", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
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
        self.navigationController?.navigationBar.tintColor = UIColor.orange
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide , object: nil)
        itemTitle.delegate = self
        itemPrice.delegate = self
        itemDescription.delegate = self
        setupViews()
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
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    // selector function for 'addItemButton'
    @objc func addItemButtonTapped() {
        
        guard let title = itemTitle.text, !title.isEmpty, let price = itemPrice.text, !price.isEmpty, let image = itemImageButton.currentImage, itemImageButton.currentImage != nil else {
            
            let alert = UIAlertController(title: "Error Adding Item", message: "Please make sure item has an image, title and price", preferredStyle: .alert)
            
            let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
            
            alert.addAction(dismiss)
            present(alert, animated: true, completion: nil)
            return
            
        }
        
        // add to firebase
        
        guard let currentImage = self.itemImageButton.currentImage else { return }
        
        guard let uploadData = UIImageJPEGRepresentation(currentImage, 0.3) else { return }
        
        let imageName = UUID().uuidString
        
        let storageImage = Storage.storage().reference().child("selling_images").child(imageName)
        storageImage.putData(uploadData, metadata: nil) { (_, error) in
            
            if let error = error {
                print("Error!: \(error.localizedDescription)")
            }
            storageImage.downloadURL(completion: { (url, error) in
                if let error = error {
                    print("Error!: \(error.localizedDescription)")
                }
                
                let imageURL = url?.absoluteString
                
                guard let uid = Auth.auth().currentUser?.uid else { return }
                let itemUID = UUID().uuidString
                print(itemUID)
                
                let dictionaryValues = ["title": title, "price": price, "image": imageURL]
                let itemsDictionary = [itemUID: dictionaryValues]
                
                Database.database().reference().child("users/\(uid)/selling").updateChildValues(itemsDictionary) { (error, _) in
                    
//                    let newItem = anotherItem(title: <#T##String#>, description: <#T##String#>, price: <#T##String#>, image: <#T##String#>)
//                    ItemController.shared.addSellingItem(item: newItem)
//                    ItemController.shared.addUserSellingItems(item: item)

                    
                    if let error = error {
                        print("Error!: \(error.localizedDescription)")
                    }
                    print("Successfully added item to selling database!")
                    self.dismiss(animated: true, completion: nil)
                }
            })
        }
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
}

extension AddItemViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            itemDescription.resignFirstResponder()
            return false
        }
        return true
    }
}

class anotherItem {
    var title: String
    var description: String
    var price: String
    var image: String
    
    init(title: String, description: String, price: String, image: String) {
        self.title = title
        self.description = description
        self.price = price
        self.image = image
        
        
    
    }
}










