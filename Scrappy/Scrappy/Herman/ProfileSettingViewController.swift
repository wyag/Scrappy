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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self 
        
        view.backgroundColor = UIColor.white
        navigationItem.title = "Edit Profile"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(rightBarButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(leftBarButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        
        setupViews()
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
    
    let profileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor.lightGray
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        return image
    }()
    
    let changeProfileImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Change Profile Photo", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.addTarget(self, action: #selector(handleImagePicker), for: .touchUpInside)
        return button
    }()
    
    let lineSeparator: UIView = {
        let label = UIView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.lightGray
        return label
    }()
    
    let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    let textfieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name"
        return label
    }()
    
    let nameTextField: SkyFloatingLabelTextField = {
        let name = SkyFloatingLabelTextField()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = UIColor.black
        name.autocorrectionType = UITextAutocorrectionType.no
        name.selectedLineHeight = 1
        name.selectedLineColor = UIColor.lightGray
        return name
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        return label
    }()
    
    let emailTextField: SkyFloatingLabelTextField = {
        let email = SkyFloatingLabelTextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.textColor = UIColor.black
        email.autocorrectionType = UITextAutocorrectionType.no
        email.selectedLineHeight = 1
        email.selectedLineColor = UIColor.lightGray
        return email
    }()

    let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        return label
    }()
    
    let passwordTextField: SkyFloatingLabelTextField = {
        let password = SkyFloatingLabelTextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.textColor = UIColor.black
        password.isSecureTextEntry = true
        password.selectedLineHeight = 1
        password.selectedLineColor = UIColor.lightGray
//        let leftView = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
//        leftView.backgroundColor = UIColor.clear
//        password.leftView = leftView
//        password.leftViewMode = .always
        return password
    }()
    
    let collectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.minimumLineSpacing = 26
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.backgroundColor = UIColor.white
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(ProfileSettingCollectionViewCell.self, forCellWithReuseIdentifier: "profileSettingCell")
        return collection
    }()
    
    func setupViews() {

        view.addSubview(profileImage)
        profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.addSubview(changeProfileImageButton)
        changeProfileImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeProfileImageButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10).isActive = true
        
        view.addSubview(lineSeparator)
        lineSeparator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true 
        lineSeparator.topAnchor.constraint(equalTo: changeProfileImageButton.bottomAnchor, constant: 24).isActive = true
        lineSeparator.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        lineSeparator.heightAnchor.constraint(equalToConstant: 0.4).isActive = true
        
        view.addSubview(labelStackView)
        labelStackView.addArrangedSubview(nameLabel)
        labelStackView.addArrangedSubview(emailLabel)
        labelStackView.addArrangedSubview(passwordLabel)
        labelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        labelStackView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 100).isActive = true
        labelStackView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.3).isActive = true
        labelStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height * 0.4)).isActive = true 
        
        view.addSubview(textfieldStackView)
        textfieldStackView.addArrangedSubview(nameTextField)
        textfieldStackView.addArrangedSubview(emailTextField)
        textfieldStackView.addArrangedSubview(passwordTextField)
        textfieldStackView.leadingAnchor.constraint(equalTo: labelStackView.trailingAnchor, constant: 15).isActive = true
        textfieldStackView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 92).isActive = true
        textfieldStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        textfieldStackView.bottomAnchor.constraint(equalTo: labelStackView.bottomAnchor).isActive = true
        
        view.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: textfieldStackView.bottomAnchor, constant: 30).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension ProfileSettingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            profileImage.image = editedImage.withRenderingMode(.alwaysOriginal)
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            profileImage.image = originalImage.withRenderingMode(.alwaysOriginal)
        }
        
        dismiss(animated: true, completion: nil)
    }
}

extension ProfileSettingViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        nameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
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

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}













