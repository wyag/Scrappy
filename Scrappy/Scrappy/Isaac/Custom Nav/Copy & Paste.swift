//
//  Copy & Paste Nav.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/15/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import Foundation


/*
 
 - - - - - - - - - - - - - - - - -> 4 Steps Respectively
 
 
 
 ******************* 1.) Add These Local Properties!!
 
 
 
 //////////////// MARK: Navigation Properties
 
 // Nav Menu UI
 let menu = CustomNavView(frame: UIScreen.main.bounds)
 let cartButton = UIBarButtonItem()
 var menuBarButton = UIBarButtonItem()
 var isMenuOpen: Bool = false
 
 
 
 
 
 
 
 
 
 
 ******************* 2.) Paste & Call This "setupNav" Function in your view did load! (Before Your UI)
 
 
 
 
 ////////////////////////////////////////////////////// MARK: Setup Nav Function
 
 func setupNav() {
 
 self.accessibilityValue = "Home"
 
 // Setup Nav Bar
 self.navigationController?.navigationBar.isHidden = false
 self.navigationController?.navigationBar.barTintColor = UIColor.black
 
 // 'menuBarButton'
 menuBarButton = UIBarButtonItem(image: UIImage(named: "hMenu"), style: .plain, target: self, action: #selector(self.menuButtonTapped(_:)))
 menuBarButton.tintColor = UIColor.orange
 self.navigationItem.setLeftBarButton(menuBarButton, animated: false)
 
 menu.closeMenuButton.addTarget(self, action: #selector(self.menuButtonTapped(_:)), for: .touchUpInside)
 menu.homeMenuButton.addTarget(self, action: #selector(self.goToVC(_:)), for: .touchUpInside)
 menu.birthdayMenuButton.addTarget(self, action: #selector(self.goToVC(_:)), for: .touchUpInside)
 menu.sesonalMenuButton.addTarget(self, action: #selector(self.goToVC(_:)), for: .touchUpInside)
 menu.holidayMenuButton.addTarget(self, action: #selector(self.goToVC(_:)), for: .touchUpInside)
 menu.sportsMenuButton.addTarget(self, action: #selector(self.goToVC(_:)), for: .touchUpInside)
 menu.congratsMenuButton.addTarget(self, action: #selector(self.goToVC(_:)), for: .touchUpInside)
 menu.miscMenuButton.addTarget(self, action: #selector(self.goToVC(_:)), for: .touchUpInside)
 menu.cartMenuButton.addTarget(self, action: #selector(self.goToVC(_:)), for: .touchUpInside)
 menu.profileButton.addTarget(self, action: #selector(self.goToVC(_:)), for: .touchUpInside)
 }
 
 
 
 
 
 
 
 ******************* 3.) Add These Functions!!
 
 //************************************************** Navigation Functions **********************************
 
 
 @objc private func menuButtonTapped(_ sender: UIBarButtonItem) {
 if !isMenuOpen {
 self.view.addSubview(menu)
 isMenuOpen = true
 menu.closeMenuButton.setImage(UIImage(named: "whiteX"), for: .normal)
 UIView.animate(withDuration: 1) {
 self.menu.navMenuView.frame.origin.x = 0
 self.menu.blurView.alpha = 1
 self.menu.closeMenuButton.alpha = 1
 }
 } else {
 print("Menu Closed")
 isMenuOpen = false
 menu.closeMenuButton.setImage(UIImage(named: "whiteX2"), for: .normal)
 UIView.animate(withDuration: 1, animations: {
 self.menu.blurView.alpha = 0
 self.menu.closeMenuButton.alpha = 0
 self.menu.navMenuView.frame.origin.x = ((self.view.frame.width/2) * -1)
 }) { (success) in
 if success {
 self.menu.removeFromSuperview()
 }
 }
 }
 }
 
 
 @objc private func goToVC(_ sender: UIButton) {
 
 print("Nav Menu Button Pressed!!")
 
 // Unwrap Button ID
 guard let id = sender.accessibilityIdentifier else { return }
 guard let vcid = self.accessibilityValue else { return }
 
 // Switch On Button ID
 switch id {
 case vcid:
 menuButtonTapped(self.menuBarButton)
 case "Home":
 self.navigationController?.popToRootViewController(animated: true)
 case "Birthday":
 menuButtonTapped(menuBarButton)
 let nextVC = CollectionViewController()
 nextVC.accessibilityValue = "Birthday"
 self.navigationController?.show(nextVC, sender: self)
 case "Seasonal":
 menuButtonTapped(menuBarButton)
 let nextVC = CollectionViewController()
 nextVC.accessibilityValue = "Seasonal"
 self.navigationController?.show(nextVC, sender: self)
 case "Holiday":
 menuButtonTapped(menuBarButton)
 let nextVC = CollectionViewController()
 nextVC.accessibilityValue = "Holiday"
 self.navigationController?.show(nextVC, sender: self)
 case "Sports":
 menuButtonTapped(menuBarButton)
 let nextVC = CollectionViewController()
 nextVC.accessibilityValue = "Sports"
 self.navigationController?.show(nextVC, sender: self)
 case "Congrats":
 menuButtonTapped(menuBarButton)
 let nextVC = CollectionViewController()
 nextVC.accessibilityValue = "Congrats"
 self.navigationController?.show(nextVC, sender: self)
 case "Misc":
 menuButtonTapped(menuBarButton)
 let nextVC = CollectionViewController()
 nextVC.accessibilityValue = "Misc"
 self.navigationController?.show(nextVC, sender: self)
 case "Profile":
 menuButtonTapped(menuBarButton)
 let nextVC = ProfileSettingViewController()
 nextVC.accessibilityValue = "Profile"
 self.navigationController?.show(nextVC, sender: self)
 case "Cart":
 menuButtonTapped(menuBarButton)
 let nextVC = CartViewController()
 nextVC.accessibilityValue = "Cart"
 self.navigationController?.show(nextVC, sender: self)
 case "Logout":
 self.navigationController?.popToRootViewController(animated: true)
 default:
 menuButtonTapped(self.menuBarButton)
 }
 }

 
 
 
 ************************************************ - DONE - ***********************
 
 */*/
