//
//  DetailCollectionViewController.swift
//  Scrappy
//
//  Created by Spencer Cawley on 5/15/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import SVProgressHUD

class DetailCollectionViewController: UIViewController {
    
    // Properties
    var itemImage: UIImage?
    var itemTitle: String?
    var itemPrice: Int? 
    var cardDescription: String?
    var passedImageView = UIImageView()
    var passedImageTitle = UILabel()
    var passedpriceLabel = UILabel()
    var passedCardDescription = UILabel()
    var shoppingButton = UIButton()
    var backButton = UIButton(type: .system)
    
    // Raiting Properties
    var raitingStackView = UIStackView()
    var raitingButtons = [UIButton()]
    let starButton = UIButton()
    var raitingNumber: Int? {
        didSet {
            updateButtonSelection()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNav()
        setupViews()
        setupViewData()
    }
    
    func setupNav() {
        self.navigationController?.navigationBar.tintColor = UIColor.orange
    }
    
    func setupViews() {
        
        // Setup Main View
        self.view.backgroundColor = UIColor.white
        
        // 'passedImageView'
        view.addSubview(passedImageView)
        passedImageView.frame = CGRect(x: 0, y: 125, width: view.frame.width, height: 300)
        passedImageView.clipsToBounds = true
        passedImageView.contentMode = .scaleAspectFit
        passedImageView.center.x = self.view.center.x
        
        // Star Raiting Stack View
        setupRaitingStackView()
        
        // 'passedImageTitle'
        view.addSubview(passedImageTitle)
        passedImageTitle.translatesAutoresizingMaskIntoConstraints = false
        passedImageTitle.textAlignment = .center
        passedImageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passedImageTitle.topAnchor.constraint(equalTo: passedImageView.bottomAnchor, constant: 50).isActive = true
        passedImageTitle.widthAnchor.constraint(equalToConstant: 250)
        passedImageTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        passedImageTitle.textColor = .black
        passedImageTitle.font = UIFont.boldSystemFont(ofSize: 25)
        
        // 'passedPriceLabel'
        view.addSubview(passedpriceLabel)
        passedpriceLabel.translatesAutoresizingMaskIntoConstraints = false
        passedpriceLabel.textAlignment = .center
        passedpriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passedpriceLabel.topAnchor.constraint(equalTo: passedImageTitle.bottomAnchor, constant: 3).isActive = true
        passedpriceLabel.heightAnchor.constraint(equalToConstant: 15)
        passedpriceLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        passedpriceLabel.font = UIFont.boldSystemFont(ofSize: 17)
        passedpriceLabel.textColor = .black
        
        // 'passedImageDescription'
        view.addSubview(passedCardDescription)
        passedCardDescription.translatesAutoresizingMaskIntoConstraints = false
        passedCardDescription.textAlignment = .center
        passedCardDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passedCardDescription.topAnchor.constraint(equalTo: passedpriceLabel.bottomAnchor, constant: 5).isActive = true
        passedCardDescription.widthAnchor.constraint(equalToConstant: (view.frame.width) - 100).isActive = true
        passedCardDescription.numberOfLines = 0
        passedCardDescription.textColor = .black

        // 'shoppingButton'
        view.addSubview(shoppingButton)
        shoppingButton.translatesAutoresizingMaskIntoConstraints = false
        shoppingButton.topAnchor.constraint(equalTo: passedCardDescription.bottomAnchor, constant: 5).isActive = true
        shoppingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        shoppingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        shoppingButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        shoppingButton.setTitle("Add Item To Cart", for: .normal)
        shoppingButton.tintColor = UIColor.white
        shoppingButton.backgroundColor = UIColor.orange
        shoppingButton.layer.cornerRadius = 3
        shoppingButton.addTarget(self, action: #selector(shoppingButtonTapped), for: .touchUpInside)
        
        // 'backButton'
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 15).isActive = true
        backButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        backButton.setImage(#imageLiteral(resourceName: "xMark").withRenderingMode(.alwaysOriginal), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
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
    
    
    // Objective-C Selector Functions
    @objc func backButtonTapped() {
        print("back to collectionView tapped")
//        dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
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
        let newCartItem = Item(withTitle: name, description: description, image: image, price: price)
        ItemController.shared.addUserCartItems(item: newCartItem)
        
        SVProgressHUD.dismiss(withDelay: 2)
    }
}
