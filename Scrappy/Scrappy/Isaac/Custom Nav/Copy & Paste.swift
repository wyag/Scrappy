//
//  Copy & Paste Nav.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/15/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import Foundation


/*
 
 ********************************************* Add These Properties!
 
 let menuView = CustomNavigationViewController()
 let menuButton = UIButton()
 
 
 
 
 
 ********************************************* Put in your "SetupUI" Function!
 
 // 'menuButton'
 menuButton.frame = CGRect(x: 40, y: 40, width: 40, height: 40)
 menuButton.backgroundColor = UIColor.white
 menuButton.addTarget(self, action: #selector(self.menuOpen(_:)), for: .touchDown)
 
 // 'menuView'
 menuView.view.frame = self.view.frame
 menuView.view.alpha = 1
 menuView.setupUI()
 menuView.closeMenuButton.addTarget(self, action: #selector(self.dismissMenu(_:)), for: .touchUpInside)
 
 self.view.addSubview(menuView.view)
 self.view.addSubview(menuButton)
 
 
 
 
 
 *********************************************** Add These Functions!
 
 @objc func menuOpen(_ sender: UIButton) {
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

 
 
 
 
 
 */
