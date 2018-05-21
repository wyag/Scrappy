//
//  ProfileSettingInputViews.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/18/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class ProfileSettingInputViews: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        stackView.spacing = 14
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
        return password
    }()
    
    let cardInfoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Card Information", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.backgroundColor = UIColor.yellow
        button.layer.cornerRadius = 5
        return button
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(profileImage)
        profileImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(changeProfileImageButton)
        changeProfileImageButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        changeProfileImageButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10).isActive = true
        
        addSubview(lineSeparator)
        lineSeparator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lineSeparator.topAnchor.constraint(equalTo: changeProfileImageButton.bottomAnchor, constant: 24).isActive = true
        lineSeparator.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        lineSeparator.heightAnchor.constraint(equalToConstant: 0.4).isActive = true
        
        addSubview(labelStackView)
        labelStackView.addArrangedSubview(nameLabel)
        labelStackView.addArrangedSubview(emailLabel)
        labelStackView.addArrangedSubview(passwordLabel)
        labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        labelStackView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 90).isActive = true
        labelStackView.widthAnchor.constraint(equalToConstant: frame.width * 0.3).isActive = true
        labelStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(frame.height * 0.4)).isActive = true
        
        addSubview(textfieldStackView)
        textfieldStackView.addArrangedSubview(nameTextField)
        textfieldStackView.addArrangedSubview(emailTextField)
        textfieldStackView.addArrangedSubview(passwordTextField)
        textfieldStackView.leadingAnchor.constraint(equalTo: labelStackView.trailingAnchor, constant: 15).isActive = true
        textfieldStackView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 78).isActive = true
        textfieldStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        textfieldStackView.bottomAnchor.constraint(equalTo: labelStackView.bottomAnchor).isActive = true
        
        addSubview(cardInfoButton)
        cardInfoButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cardInfoButton.topAnchor.constraint(equalTo: textfieldStackView.bottomAnchor, constant: 5).isActive = true
        cardInfoButton.widthAnchor.constraint(equalToConstant: frame.width * 0.7).isActive = true
        cardInfoButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: textfieldStackView.bottomAnchor, constant: 60).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
