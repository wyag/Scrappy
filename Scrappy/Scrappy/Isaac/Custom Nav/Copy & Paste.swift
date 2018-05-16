//
//  Copy & Paste Nav.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/15/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import Foundation


/*
 
 *********** 3 Steps Respectively
 
 ********************************************* 1.) Add These Local Properties!!
 
 // Nav Menu
 let menuView = CustomNavigationViewController()
 let customNavBarView = UIView()
 let navTitleLabel = UILabel()
 let menuButton = UIButton()
 
 
 
 
 
 ********************************************* 2.) Put in your "SetupUI" Function!!
 
 
 
 //////////////// MARK: Setup Navigation
 
 // 'menuView'
 menuView.view.frame = self.view.frame
 menuView.view.alpha = 1
 
 self.accessibilityValue = "2"   // ************************ Change this to your page's #
 
 menuView.closeMenuButton.addTarget(self, action: #selector(self.dismissMenu(_:)), for: .touchUpInside)
 
 // 'customeNavBarView'
 self.navigationController?.navigationBar.isHidden = true
 customNavBarView.backgroundColor = UIColor.orange
 customNavBarView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width/6.9)
 
 // Setup Nav Title
 let navTitleLabelAT = NSMutableAttributedString(string: "Home", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: self.view.frame.width/20.7) as Any])
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
 
 
 
 
 
 *********************************************** 3.) Add These Functions!!
 
 
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

 
 
 
 
 
 */
