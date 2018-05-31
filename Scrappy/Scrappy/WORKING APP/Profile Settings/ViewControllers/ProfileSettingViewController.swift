//
//  ProfileSettingViewController.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/15/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import Firebase
import SkyFloatingLabelTextField

protocol ProfileSettingViewControllerDelegate: class {
    func profileButtonTapped(image: UIImage)
}

class ProfileSettingViewController: UIViewController {
    
    let profileSettingInputViews = ProfileSettingInputViews(frame: UIScreen.main.bounds)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        profileSettingInputViews.profileImage.image = ItemController.shared.profileImage
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(profileSettingInputViews)
        
        profileSettingInputViews.nameTextField.delegate = self
        profileSettingInputViews.emailTextField.delegate = self
        profileSettingInputViews.passwordTextField.delegate = self
        profileSettingInputViews.collectionView.delegate = self
        profileSettingInputViews.collectionView.dataSource = self
        
        view.backgroundColor = UIColor.white
        navigationItem.title = "Edit Profile"
        
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(rightBarButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(leftBarButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        
        profileSettingInputViews.changeProfileImageButton.addTarget(self, action: #selector(handleImagePicker), for: .touchUpInside)
        profileSettingInputViews.cardInfoButton.addTarget(self, action: #selector(cardInfoButtonTapped), for: .touchUpInside)
        
        profileSettingInputViews.profileImage.image = ItemController.shared.profileImage
    }
    
    var delegate: ProfileSettingViewControllerDelegate?
    
    @objc func cardInfoButtonTapped() {
        
    }
    
    @objc func handleImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func rightBarButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func leftBarButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func handleImageDownload() {
        
        guard let image = self.profileSettingInputViews.profileImage.image else { return }
        
        ItemController.shared.addProfileImage(image: image)
    }
}

extension ProfileSettingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            
            
            self.profileSettingInputViews.profileImage.image = editedImage.withRenderingMode(.alwaysOriginal)
            
            self.delegate?.profileButtonTapped(image: editedImage.withRenderingMode(.alwaysOriginal))
            
            
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            
            self.profileSettingInputViews.profileImage.image = originalImage.withRenderingMode(.alwaysOriginal)
            
            self.delegate?.profileButtonTapped(image: originalImage.withRenderingMode(.alwaysOriginal))
            
        }
        
        handleImageDownload()
        dismiss(animated: true, completion: nil)
    }
}

extension ProfileSettingViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        profileSettingInputViews.nameTextField.resignFirstResponder()
        profileSettingInputViews.emailTextField.resignFirstResponder()
        profileSettingInputViews.passwordTextField.resignFirstResponder()
        return true
    }
}

extension ProfileSettingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ItemController.shared.userSellingItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profileSettingCell", for: indexPath) as? ProfileSettingCollectionViewCell else { return UICollectionViewCell() }
        cell.image.image = ItemController.shared.userSellingItems[indexPath.row].image
        cell.itemLabel.text = ItemController.shared.userSellingItems[indexPath.row].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Profile setting cell tapped")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2.5, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 20, bottom: 20, right: 20)
    }
}













