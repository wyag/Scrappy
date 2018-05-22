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

class ProfileSettingViewController: UIViewController {
    
    let profileSettingInputViews = ProfileSettingInputViews(frame: UIScreen.main.bounds)

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
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(rightBarButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(leftBarButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        
        profileSettingInputViews.changeProfileImageButton.addTarget(self, action: #selector(handleImagePicker), for: .touchUpInside)
        profileSettingInputViews.cardInfoButton.addTarget(self, action: #selector(cardInfoButtonTapped), for: .touchUpInside)
    }
    
    @objc func cardInfoButtonTapped() {
        let stripePaymentVC = StripePaymentViewController()
        present(stripePaymentVC, animated: true, completion: nil)
    }
    
    @objc func handleImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func rightBarButtonTapped() {
        dismiss(animated: true, completion: nil)  
    }
    
    @objc func leftBarButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    func handleImageDownload() {
        
        guard let image = self.profileSettingInputViews.profileImage.image else { return }
        
        guard let uploadData = UIImageJPEGRepresentation(image, 0.3) else { return }
        
        let fileName = UUID().uuidString
        
        let storageItem = Storage.storage().reference().child("profile_images").child(fileName)
        storageItem.putData(uploadData, metadata: nil) { (metadata, error) in
            
            if let error = error {
                print("Failed to upload profile image", error)
            }
            
            storageItem.downloadURL(completion: { (url, error) in
                if let error = error {
                    print("Failed to downloadURL to storage", error)
                }
                
                let imageUrl = url?.absoluteString
                guard let uid = Auth.auth().currentUser?.uid else { return }
                
                let dictionaryValues = ["profileImageUrl": imageUrl]
                let values = [uid: dictionaryValues]
                
                Database.database().reference().child("users").updateChildValues(values, withCompletionBlock: { (error, reference) in
                    if let error = error {
                        print("Failed to save user image to db:", error)
                    }
                    
                    print("Successfully saved user image to db:")
                })
            })
        }
    }
    
}

extension ProfileSettingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            profileSettingInputViews.profileImage.image = editedImage.withRenderingMode(.alwaysOriginal)
            
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            profileSettingInputViews.profileImage.image = originalImage.withRenderingMode(.alwaysOriginal)
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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profileSettingCell", for: indexPath) as? ProfileSettingCollectionViewCell else { return UICollectionViewCell() }
        return cell 
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}













