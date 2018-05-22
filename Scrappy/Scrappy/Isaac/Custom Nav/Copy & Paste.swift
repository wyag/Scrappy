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
 
 // Nav Menu
 let menuView = CustomNavigationViewController()
 let customNavBarView = UIView()
 let navTitleLabel = UILabel()
 let menuButton = UIButton()
 let cartButton = UIButton()
 var moreThanOneVC: Bool?
 
 
 
 
 
 
 
 
 
 
 ******************* 2.) Paste & Call This "setupNav" Function in your view did load! (Before Your UI)
 
 
 
 
 ////////////////////////////////////////////////////// MARK: Setup Nav Function
 
 func setupNav() {
 
 // 'menuView'
 menuView.view.frame = self.view.frame
 menuView.view.alpha = 1
 menuView.closeMenuButton.addTarget(self, action: #selector(self.dismissMenu(_:)), for: .touchUpInside)
 
 self.accessibilityValue = "1"
 
 // 'customeNavBarView'
 self.navigationController?.navigationBar.isHidden = true
 customNavBarView.backgroundColor = UIColor.black
 customNavBarView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width/6.9)
 customNavBarView.alpha = 0.7
 
 // Setup Nav Title
 let navTitleLabelAT = NSMutableAttributedString(string: "Scrappy", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: self.view.frame.width/20.7) as Any])
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
 
 // 'cartButton'
 cartButton.setImage(UIImage(named: "basketorange"), for: .normal)
 cartButton.setImage(UIImage(named: "basketorange"), for: .highlighted)
 cartButton.setImage(UIImage(named: "basketorange"), for: .selected)
 cartButton.backgroundColor = UIColor.clear
 cartButton.frame = CGRect(x: 360, y: 0, width: 40, height: 40)
 cartButton.accessibilityIdentifier = "9"
 cartButton.addTarget(self, action: #selector(self.changeVC(_:)), for: .touchUpInside)
 
 
 /////// Add Subview's
 self.view.addSubview(menuView.view)
 self.view.addSubview(customNavBarView)
 customNavBarView.addSubview(navTitleLabel)
 navTitleLabel.center.x = customNavBarView.center.x
 navTitleLabel.center.y = self.view.frame.height/18.4
 customNavBarView.addSubview(menuButton)
 menuButton.center.y = self.view.frame.height/18.4
 customNavBarView.addSubview(cartButton)
 cartButton.center.y = self.view.frame.height/18.4
 
 //////// Add Targets to Menu Button's
 menuView.homeMenuButton.addTarget(self, action: #selector(self.changeVC(_:)), for: .touchUpInside)
 menuView.birthdayMenuButton.addTarget(self, action: #selector(self.changeVC(_:)), for: .touchUpInside)
 menuView.sesonalMenuButton.addTarget(self, action: #selector(self.changeVC(_:)), for: .touchUpInside)
 menuView.holidayMenuButton.addTarget(self, action: #selector(self.changeVC(_:)), for: .touchUpInside)
 menuView.sportsMenuButton.addTarget(self, action: #selector(self.changeVC(_:)), for: .touchUpInside)
 menuView.congratsMenuButton.addTarget(self, action: #selector(self.changeVC(_:)), for: .touchUpInside)
 menuView.miscMenuButton.addTarget(self, action: #selector(self.changeVC(_:)), for: .touchUpInside)
 menuView.logOutMenuButton.addTarget(self, action: #selector(self.changeVC(_:)), for: .touchUpInside)
 menuView.profileButton.addTarget(self, action: #selector(self.changeVC(_:)), for: .touchUpInside)
 }
 
 
 
 
 
 
 
 
 ******************* 3.) Add These Functions!!
 
 
 
 
 
 
 //************************************************** Navigation Functions **********************************
 
 
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
 
 
 
 
 @objc private func changeVC(_ sender: UIButton) {
 
 // Next View Controller
 var nextVC: UIViewController!
 
 // Array of Possible View Controllers
 let vcS = [LoginViewController(),HomeViewController(), CollectionViewController(), CollectionViewController(), CollectionViewController(), CollectionViewController(), CollectionViewController(), CollectionViewController(), DetailCollectionViewController(), CartViewController(), ProfileSettingViewController()]
 
 // Array of Possible Nav Button Identifiers
 let identifiers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
 
 // Nav Button's Identifier
 guard let id = sender.accessibilityIdentifier else { return }
 
 // Index of 'id' for index of 'vcS'
 if identifiers.contains(id) {
 guard let index = identifiers.index(of: id) else { return }
 nextVC = vcS[index]
 }
 
 // Current VC's Nav Index
 guard let index = Int(self.accessibilityValue!) else { return }
 
 // Find Correct Direction
 switch nextVC {
 
 // Current VC | Close Menu
 case vcS[index]:
 dismissMenu(sender) ; return
 
 // Login | Pop To Root
 case vcS[0]:
 self.navigationController?.popToRootViewController(animated: true)
 return
 
 // Home | Pop To
 case vcS[1]: self.navigationController?.popToViewController((self.navigationController?.viewControllers[1])!, animated: true)
 return
 
 // Item Collection's | Show
 case vcS[2], vcS[3], vcS[4], vcS[5], vcS[6], vcS[7]:
 guard let destinationVC = (nextVC as? CollectionViewController) else { return }
 self.dismissMenu(sender)
 destinationVC.accessibilityValue = id
 self.navigationController?.show(destinationVC, sender: self)
 return
 
 // Item Detail | Present
 case vcS[8]: return // Go To Detail View
 
 // Cart | Show
 case vcS[9]:
 guard let destinationVC = (nextVC as? CartViewController) else { return }
 destinationVC.accessibilityValue = id
 self.navigationController?.show(nextVC, sender: self)
 
 // Profile | Show
 case vcS[10]:
 guard let destinationVC = (nextVC as? ProfileSettingViewController) else { return }
 destinationVC.accessibilityValue = id
 self.navigationController?.show(nextVC, sender: self)
 
 // Default | Close Menu
 default: self.dismissMenu(sender) ; return
 
 }
 }

 
 
 
 ************************************************ - DONE - ***********************
 
 */*/
