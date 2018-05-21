//
//  DetailCollectionViewController.swift
//  Scrappy
//
//  Created by Spencer Cawley on 5/15/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class DetailCollectionViewController: UIViewController {
    
    // Properties
    var itemImage: UIImage?
    var itemTitle: String?
    var cardDescription: String?
    var passedImageView = UIImageView()
    var passedImageTitle = UILabel()
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
    
    // Nav Menu
    let menuView = CustomNavigationViewController()
    let customNavBarView = UIView()
    let navTitleLabel = UILabel()
    let menuButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupViewData()
    }
    
    func setupViews() {
        
        // Setup Main View
        self.view.backgroundColor = UIColor.white
        
        //////////////// MARK: Setup Navigation
        
        // 'menuView'
        menuView.view.frame = self.view.frame
        menuView.view.alpha = 1
        
        self.accessibilityValue = "4"
        
        menuView.closeMenuButton.addTarget(self, action: #selector(self.dismissMenu(_:)), for: .touchUpInside)
        
        // 'customeNavBarView'
        self.navigationController?.navigationBar.isHidden = true
        customNavBarView.backgroundColor = UIColor.orange
        customNavBarView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width/6.9)
        
        // Setup Nav Title
        let navTitleLabelAT = NSMutableAttributedString(string: "Donald Trump", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: self.view.frame.width/20.7) as Any])
        navTitleLabel.attributedText = navTitleLabelAT
        navTitleLabel.frame = CGRect(x: 0, y: 0, width: self.view.frame.width/4.14, height: self.view.frame.width/20.7)
        navTitleLabel.sizeToFit()
        
        // 'menuButton'
        menuButton.setImage(UIImage(named: "hMenu"), for: .normal)
        menuButton.setImage(UIImage(named: "hMenu"), for: .highlighted)
        menuButton.setImage(UIImage(named: "hMenu"), for: .selected)
        menuButton.backgroundColor = UIColor.clear
        menuButton.frame = CGRect(x: self.view.frame.width/20.7, y: 0, width: self.view.frame.width/13.8, height: self.view.frame.width/13.8)
        menuButton.addTarget(self, action: #selector(self.menuOpen(_:)), for: .touchUpInside)
        
        // Add Subview's
        self.view.addSubview(menuView.view)
        self.view.addSubview(customNavBarView)
        customNavBarView.addSubview(navTitleLabel)
        navTitleLabel.center.x = customNavBarView.center.x
        navTitleLabel.center.y = self.view.frame.height/18.4
        customNavBarView.addSubview(menuButton)
        menuButton.center.y = self.view.frame.height/18.4
        
        
        // 'passedImageView'
        view.addSubview(passedImageView)
        passedImageView.frame = CGRect(x: 0, y: 125, width: (view.frame.width) - 100, height: 300)
        passedImageView.clipsToBounds = true
        passedImageView.backgroundColor = .black
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
        
        // 'passedImageDescription'
        view.addSubview(passedCardDescription)
        passedCardDescription.translatesAutoresizingMaskIntoConstraints = false
        passedCardDescription.textAlignment = .center
        passedCardDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passedCardDescription.topAnchor.constraint(equalTo: passedImageTitle.bottomAnchor, constant: 10).isActive = true
        passedCardDescription.widthAnchor.constraint(equalToConstant: (view.frame.width) - 100).isActive = true
        passedCardDescription.heightAnchor.constraint(equalToConstant: 100).isActive = true
        passedCardDescription.numberOfLines = 10
        passedCardDescription.textColor = .black
        
        // 'shoppingButton'
        view.addSubview(shoppingButton)
        shoppingButton.frame = CGRect(x: 0, y: (self.view.frame.maxY - 75), width: 50, height: 50)
        shoppingButton.setImage(#imageLiteral(resourceName: "Shoppinglist"), for: .normal)
        shoppingButton.center.x = self.view.center.x
        shoppingButton.addTarget(self, action: #selector(shoppingButtonTapped), for: .touchUpInside)
        
        // 'backButton'
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: customNavBarView.bottomAnchor, constant: 15).isActive = true
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
        guard let cardDescript = cardDescription else { return }
        
        // Updating passed data
        passedImageView.image = image
        passedImageTitle.text = title
        passedCardDescription.text = cardDescript
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
        print("shopping button tapped")
    }
    
    @objc private func menuOpen(_ sender: UIButton) {
        menuView.setupUI(view: self)
        self.view.bringSubview(toFront: menuView.view)
        menuView.view.alpha = 1
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            self.menuView.menuButtonTapped(sender)
        }, completion: nil)
    }
    
    @objc private func dismissMenu(_ sender: UIButton) {
        UIView.animate(withDuration: 1) {
            self.menuView.dismissNavMenu(sender)
            self.menuView.view.alpha = 0
        }
    }
}
