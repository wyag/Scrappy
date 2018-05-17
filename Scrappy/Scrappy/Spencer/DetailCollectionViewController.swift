//
//  DetailCollectionViewController.swift
//  Scrappy
//
//  Created by Spencer Cawley on 5/15/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class DetailCollectionViewController: UIViewController {
    
    var itemImage: UIImage?
    var itemTitle: String?
    var passedImageView = UIImageView()
    var passedImageTitle = UILabel()
    var shoppingButton = UIButton()
    
    let menuView = CustomNavigationViewController()
    let menuButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        
        // Setup Main View
        self.view.backgroundColor = UIColor.white
        
        // Unwrap Optional properties
        guard let image = itemImage else { return }
        guard let title = itemTitle else { return }
        
        // 'passedImageView'
        view.addSubview(passedImageView)
        passedImageView.image = image
        passedImageView.frame = CGRect(x: 0, y: 100, width: (view.frame.width / 3) - 16, height: 200)
        passedImageView.backgroundColor = .black
        passedImageView.center.x = self.view.center.x
        
        // 'passedImageTitle"
        view.addSubview(passedImageTitle)
        passedImageTitle.text = title
        passedImageTitle.frame = CGRect(x: 0, y: (passedImageView.frame.maxY + 20), width: 100 , height: 20)
        passedImageTitle.textColor = .black
        passedImageTitle.center.x = self.view.center.x
        
        // 'shoppingButton'
        view.addSubview(shoppingButton)
        shoppingButton.frame = CGRect(x: 0, y: (self.view.frame.maxY - 100), width: 50, height: 50)
        shoppingButton.setImage(#imageLiteral(resourceName: "Shoppinglist"), for: .normal)
        shoppingButton.center.x = self.view.center.x
        
        // 'menuButton'
        menuButton.frame = CGRect(x: 40, y: 40, width: 40, height: 40)
        menuButton.backgroundColor = UIColor.black
        menuButton.addTarget(self, action: #selector(self.menuOpen(_:)), for: .touchDown)
        
        // 'menuView'
        self.view.addSubview(menuButton)
        
    }
    
    @objc func menuOpen(_ sender: UIButton) {
        
        menuView.view.frame = self.view.frame
        menuView.view.alpha = 1
        //menuView.setupUI()
        menuView.closeMenuButton.addTarget(self, action: #selector(self.dismissMenu(_:)), for: .touchUpInside)
        self.view.addSubview(menuView.view)
        self.view.bringSubview(toFront: menuView.view)
        menuView.view.alpha = 1
        
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            self.menuView.menuButtonTapped(sender)
        }, completion: nil)
    }
    
    @objc func dismissMenu(_ sender: UIButton) {
        UIView.animate(withDuration: 1) {
            self.menuView.dismissNavMenu(sender)
            self.menuView.view.alpha = 0
        }
    }
    
    
    

    
}
