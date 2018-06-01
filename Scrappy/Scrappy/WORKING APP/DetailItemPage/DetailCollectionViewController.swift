//
//  DetailCollectionViewController.swift
//  Scrappy
//
//  Created by Spencer Cawley on 5/15/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import SVProgressHUD
import Firebase

class DetailCollectionViewController: UIViewController {
    
    // Raiting Properties
    var raitingStackView = UIStackView()
    var raitingButtons = [UIButton()]
    let starButton = UIButton()
    var raitingNumber: Int? {
        didSet {
            updateButtonSelection()
        }
    }
    
    // Properties
    var itemImage: UIImage?
    var itemTitle: String?
    var itemPrice: Int?
    var cardDescription: String? 
    var sellerUID: String? 
    
    var passedImageView: UIImageView = {
       let image =  UIImageView()
        image.clipsToBounds = true
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var sellerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    var sellerProfileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        return image
    }()
    
    var sellerUsername: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Username Test"
        label.textColor = UIColor.black
        return label
    }()
    
    var passedImageTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.textColor = .black
        title.font = UIFont.boldSystemFont(ofSize: 25)
       return title
    }()
    var passedpriceLabel: UILabel = {
       let price = UILabel()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.textAlignment = .center
        price.font = UIFont.boldSystemFont(ofSize: 17)
        price.textColor = .black
        return price
    }()
    var passedCardDescription: UILabel = {
        let card = UILabel()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.textAlignment = .center
        card.numberOfLines = 7
        card.textColor = .black
        return card
    }()
    var shoppingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add Item To Cart", for: .normal)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.orange
        button.layer.cornerRadius = 3
        return button
    }()
    var backButton = UIButton(type: .system)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor.orange
        let tapped = UITapGestureRecognizer(target: self, action: #selector(uiViewTapped))
        sellerView.addGestureRecognizer(tapped)
        setupViews()
        setupViewData()
    }
    
    @objc func uiViewTapped() {
        
        let vc = SellerPageViewController()
        vc.sellerProfileImage.image = sellerProfileImage.image
        vc.sellerUsername.text = sellerUsername.text
        vc.sellerUID = sellerUID
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupViews() {
        
        // Setup Main View
        self.view.backgroundColor = UIColor.white
        
        // 'passedImageView'
        view.addSubview(passedImageView)
        passedImageView.frame = CGRect(x: 0, y: 105, width: view.frame.width, height: (view.frame.height / 2.5))
//        passedImageView.frame = CGRect(x: 0, y: 105, width: view.frame.width, height: 300)
        passedImageView.center.x = self.view.center.x
        
        // 'sellerView'
        view.addSubview(sellerView)
        sellerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        sellerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        sellerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        sellerView.bottomAnchor.constraint(equalTo: passedImageView.topAnchor).isActive = true
        
        
        // 'sellersProfimeImage'
        sellerView.addSubview(sellerProfileImage)
        sellerProfileImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        sellerProfileImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        sellerProfileImage.bottomAnchor.constraint(equalTo: sellerView.bottomAnchor, constant: -5).isActive = true
        sellerProfileImage.leadingAnchor.constraint(equalTo: sellerView.leadingAnchor, constant: 5).isActive = true
        sellerProfileImage.topAnchor.constraint(equalTo: sellerView.topAnchor, constant: 5).isActive = true

        // 'sellerUsername'
        sellerView.addSubview(sellerUsername)
        sellerUsername.centerYAnchor.constraint(equalTo: sellerProfileImage.centerYAnchor).isActive = true
        sellerUsername.leadingAnchor.constraint(equalTo: sellerProfileImage.trailingAnchor, constant: 5).isActive = true
        sellerUsername.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        // Star Raiting Stack View
        setupRaitingStackView()
        
        // 'passedImageTitle'
        view.addSubview(passedImageTitle)
        passedImageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passedImageTitle.topAnchor.constraint(equalTo: passedImageView.bottomAnchor, constant: 50).isActive = true
        passedImageTitle.widthAnchor.constraint(equalToConstant: 250)
        passedImageTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        // 'passedPriceLabel'
        view.addSubview(passedpriceLabel)
        passedpriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passedpriceLabel.topAnchor.constraint(equalTo: passedImageTitle.bottomAnchor, constant: 3).isActive = true
        passedpriceLabel.heightAnchor.constraint(equalToConstant: 15)
        passedpriceLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        // 'passedImageDescription'
        view.addSubview(passedCardDescription)
        passedCardDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passedCardDescription.topAnchor.constraint(equalTo: passedpriceLabel.bottomAnchor, constant: 5).isActive = true
        passedCardDescription.widthAnchor.constraint(equalToConstant: (view.frame.width) - 100).isActive = true

        // 'shoppingButton'
        view.addSubview(shoppingButton)
        shoppingButton.topAnchor.constraint(equalTo: passedCardDescription.bottomAnchor, constant: 5).isActive = true
        shoppingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        shoppingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        shoppingButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        shoppingButton.addTarget(self, action: #selector(shoppingButtonTapped), for: .touchUpInside)
    }
    
    func setupViewData() {
        
        // Unwrap Optional properties
        guard let image = itemImage else { return }
        guard let title = itemTitle else { return }
        guard let price = itemPrice else { return }
        guard let cardDescript = cardDescription else { return }
        
        // Updating passed data
        passedImageView.image = image
        passedImageTitle.text = title
        passedCardDescription.text = cardDescript
        passedpriceLabel.text = "$\(price)"
    }
    
     // Star Raiting function
        func setupRaitingStackView() {

            view.addSubview(raitingStackView)
            raitingStackView.translatesAutoresizingMaskIntoConstraints = false
            raitingStackView.axis = .horizontal
            raitingStackView.distribution = .fillEqually
            raitingStackView.topAnchor.constraint(equalTo: passedImageView.bottomAnchor, constant: 15).isActive = true
            raitingStackView.widthAnchor.constraint(equalToConstant: 150).isActive = true
            raitingStackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
            raitingStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

            for _ in 0..<5 {
                let starButton = UIButton()
                starButton.setImage(#imageLiteral(resourceName: "emptyStar"), for: .normal)
                starButton.setImage(#imageLiteral(resourceName: "fullStar"), for: .selected)
                starButton.setImage(#imageLiteral(resourceName: "highlightedStar"), for: .highlighted)
                starButton.setImage(#imageLiteral(resourceName: "highlightedStar"), for: [.highlighted, .selected])
                starButton.translatesAutoresizingMaskIntoConstraints = false
                starButton.addTarget(self, action: #selector(raitingButtonTapped(button:)), for: .touchUpInside)
                raitingStackView.addArrangedSubview(starButton)
                raitingButtons.append(starButton)
            }

            if let itemRaiting = raitingNumber {
                if itemRaiting == 1 {
                    raitingButtons[1].isSelected = true
                }

                if itemRaiting == 2 {
                    raitingButtons[1].isSelected = true
                    raitingButtons[2].isSelected = true
                }

                if itemRaiting == 3 {
                    raitingButtons[1].isSelected = true
                    raitingButtons[2].isSelected = true
                    raitingButtons[3].isSelected = true
                }

                if itemRaiting == 4 {
                    raitingButtons[1].isSelected = true
                    raitingButtons[2].isSelected = true
                    raitingButtons[3].isSelected = true
                    raitingButtons[4].isSelected = true
                }

                if itemRaiting == 5 {
                    raitingButtons[1].isSelected = true
                    raitingButtons[2].isSelected = true
                    raitingButtons[3].isSelected = true
                    raitingButtons[4].isSelected = true
                    raitingButtons[5].isSelected = true
                }
            }
        }
    
    // Update Raiting function
    func updateButtonSelection() {
        guard let raiting = raitingNumber else { return }
        for (index, button) in raitingButtons.enumerated() {
            button.isSelected = index < raiting
        }
    }
    
    @objc func raitingButtonTapped(button: UIButton) {
        guard let index = raitingButtons.index(of: button) else { return }
        let selectedRaiting = index + 1
        if selectedRaiting == raitingNumber {
            raitingNumber = 0
        } else {
            raitingNumber = selectedRaiting
        }
    }
    
    @objc func shoppingButtonTapped() {
        SVProgressHUD.show(withStatus: "Adding Item To Cart...")
        
        guard let name = itemTitle else { return }
        guard let image = itemImage else { return }
        guard let description = cardDescription else { return }
        guard let price = itemPrice else { return }
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let newCartItem = Item(withTitle: name, description: description, image: image, price: price, sellerUID: uid)
        ItemController.shared.addUserCartItems(item: newCartItem)
        SVProgressHUD.dismiss(withDelay: 0.5)
        
        navigationController?.popViewController(animated: true)
    }
}
