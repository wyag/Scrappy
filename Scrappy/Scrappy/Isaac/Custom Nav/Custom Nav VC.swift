//
//  CustomNavigationViewController.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/15/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class CustomNavigationViewController: UIViewController {

    // Nav Menu
    let menuView = UIView()
    
    // Nav Menu Button(s)
    let oneMenuButton = UIButton()
    let twoMenuButton = UIButton()
    let threeMenuButton = UIButton()
    let fourMenuButton = UIButton()
    let closeMenuButton = UIButton()
    let logOutMenuButton = UIButton()
    
    // Blur View
    var blurView = UIVisualEffectView()
    
    func setupUI() {
        
        // 'menuView'
        menuView.frame = CGRect(x: -140, y: 0, width: 140, height: self.view.frame.height)
        menuView.backgroundColor = UIColor.orange
        
        // 'oneMenuButton'
        oneMenuButton.backgroundColor = UIColor.clear
        let oneMenuButtonAT = NSMutableAttributedString(string: "Category 1", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        oneMenuButton.setAttributedTitle(oneMenuButtonAT, for: .normal)
        oneMenuButton.frame = CGRect(x: 0, y: 80, width: 100, height: 20)
        oneMenuButton.sizeToFit()
        oneMenuButton.frame.origin.x = 10
        
        // 'twoMenuButton'
        let twoMenuButtonAT = NSMutableAttributedString(string: "Category 2", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        twoMenuButton.setAttributedTitle(twoMenuButtonAT, for: .normal)
        twoMenuButton.backgroundColor = UIColor.clear
        twoMenuButton.frame = CGRect(x: 0, y: 120, width: 100, height: 20)
        twoMenuButton.sizeToFit()
        twoMenuButton.frame.origin.x = 10
        
        // 'threeMenuButton'
        let threeMenuButtonAT = NSMutableAttributedString(string: "Category 3", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        threeMenuButton.setAttributedTitle(threeMenuButtonAT, for: .normal)
        threeMenuButton.backgroundColor = UIColor.clear
        threeMenuButton.frame = CGRect(x: 0, y: 160, width: 100, height: 20)
        threeMenuButton.sizeToFit()
        threeMenuButton.frame.origin.x = 10
        
        // 'fourMenuButton'
        let fourMenuButtonAT = NSMutableAttributedString(string: "Category 4", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        fourMenuButton.setAttributedTitle(fourMenuButtonAT, for: .normal)
        fourMenuButton.backgroundColor = UIColor.clear
        fourMenuButton.frame = CGRect(x: 0, y: 200, width: 100, height: 20)
        fourMenuButton.sizeToFit()
        fourMenuButton.frame.origin.x = 10
        
        
        // 'logOutMenuButton'
        let logOutMenuButtonAT = NSMutableAttributedString(string: "Log Out", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        logOutMenuButton.setAttributedTitle(logOutMenuButtonAT, for: .normal)
        logOutMenuButton.backgroundColor = UIColor.clear
        logOutMenuButton.frame = CGRect(x: 0, y: 420, width: 100, height: 20)
        logOutMenuButton.sizeToFit()
        logOutMenuButton.frame.origin.x = 10
        
        // 'closeMenuButton'
        let closeMenuButtonAT = NSMutableAttributedString(string: "X", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 20) as Any])
        closeMenuButton.setAttributedTitle(closeMenuButtonAT, for: .normal)
        closeMenuButton.backgroundColor = UIColor.clear
        closeMenuButton.frame = CGRect(x: 0, y: 480, width: 100, height: 20)
        closeMenuButton.sizeToFit()
        closeMenuButton.frame.origin.x = 10
        closeMenuButton.addTarget(self, action: #selector(self.dismissNavMenu(_:)), for: .touchUpInside)
        
        // 'blurView'
        blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blurView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        blurView.alpha = 0
        
        // Add Subview's to Main View
        self.view.addSubview(menuView)
        
        // Add Subview's for Menu
        menuView.addSubview(oneMenuButton)
        menuView.addSubview(twoMenuButton)
        menuView.addSubview(threeMenuButton)
        menuView.addSubview(fourMenuButton)
        menuView.addSubview(closeMenuButton)
        menuView.addSubview(logOutMenuButton)
    }
    
    
    
    ///////////////////////////////////////////////// MARK: Menu Button Function
    
    @objc func menuButtonTapped(_ sender: UIButton) {
        
        print("Second Menu Button Tapped!")
        
        // Setup Main View
        blurView.alpha = 1
        
        // Main View Animation
        UIView.animate(withDuration: 0.5, animations: {
            self.view.addSubview(self.blurView)
            self.addedAnimation()
        }, completion: nil)
    }
    
    
    
    ///////////////////////////////////////////////// MARK: Dismiss Menu Function
    
    @objc func dismissNavMenu(_ sender: UIButton) {
        
        print("Close Menu!")
        
        UIView.animate(withDuration: 0.7) {
            self.blurView.alpha = 0
            self.menuView.frame.origin.x = -140
        }
        
    }
    
    
    ///////////////////////////////////////////////// MARK: 'blurView' Animation
    
    func addedAnimation() {
        UIView.animate(withDuration: 0.3) {
            self.blurView.alpha = 1
            self.menuAnimation()
        }
    }
    
    
    ///////////////////////////////////////////////// MARK: 'menuView' Nav Menu Animation
    
    func menuAnimation() {
        self.view.bringSubview(toFront: menuView)
        UIView.animate(withDuration: 3) {
            self.menuView.frame.origin.x = 0
        }
    }

}
