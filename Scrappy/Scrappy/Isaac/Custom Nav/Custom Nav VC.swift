//
//  CustomNavigationViewController.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/15/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit




class CustomNavigationViewController: UIViewController, UIViewControllerTransitioningDelegate {

    // Transition
    let transition = CircularTransition()
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .show
        transition.startingPoint = birthdayMenuButton.center
        transition.circleColor = UIColor.white
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .pop
        transition.startingPoint = birthdayMenuButton.center
        transition.circleColor = UIColor.white
        return transition
    }
    
    // Blur View
    var blurView = UIVisualEffectView()
    let closeMenuButton = UIButton()
    
    
    // Nav Menu
    let menuView = UIView()
    let circleView = UIView()
    
    // Nav Menu Button(s)
    let homeMenuButton = UIButton()
    // Category(s)
    let birthdayMenuButton = UIButton()
    let sesonalMenuButton = UIButton()
    let holidayMenuButton = UIButton()
    let sportsMenuButton = UIButton()
    let congratsMenuButton = UIButton()
    let miscMenuButton = UIButton()
    let logOutMenuButton = UIButton()

    
    func setupUI(view: UIViewController) {
        
        // Setup Button Colors
        guard let identifier = view.accessibilityValue else { return }
        let identifiers = ["1", "2", "3", "4", "5", "6", "7"]
        var colors = [UIColor.white, UIColor.white, UIColor.white, UIColor.white, UIColor.white, UIColor.white, UIColor.white]
        if identifiers.contains(identifier) {
            let index = identifiers.index(of: identifier)
            colors.remove(at: index!)
            colors.insert(UIColor.darkGray, at: index!)
        }
        
        // Setup View's
        
        // 'blurView'
        blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blurView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        blurView.alpha = 0
        
        // 'closeMenuButton'
        closeMenuButton.setImage(UIImage(named: "whiteX"), for: .normal)
        closeMenuButton.setImage(UIImage(named: "whiteX"), for: .highlighted)
        closeMenuButton.setImage(UIImage(named: "whiteX"), for: .selected)
        closeMenuButton.backgroundColor = UIColor.clear
        closeMenuButton.frame = CGRect(x: (self.view.frame.width/2), y: 0, width: (self.view.frame.width/2), height: self.view.frame.height)
        closeMenuButton.alpha = 0
        
        // 'circleView'
        circleView.frame = CGRect(x: 100, y: 0, width: 10, height: 10)
        circleView.layer.cornerRadius = 5
        circleView.clipsToBounds = true
        circleView.backgroundColor = UIColor.darkGray
        
        // 'menuView'
        menuView.frame = CGRect(x: ((self.view.frame.width/2) * -1), y: 0, width: (self.view.frame.width/2), height: self.view.frame.height)
        menuView.backgroundColor = UIColor.orange
        
        // Setup Button's
        
        // 'homeMenuButton'
        homeMenuButton.backgroundColor = UIColor.clear
        let oneMenuButtonAT = NSMutableAttributedString(string: "Home", attributes: [NSAttributedStringKey.foregroundColor: colors[0], NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 20) as Any])
        homeMenuButton.setAttributedTitle(oneMenuButtonAT, for: .normal)
        homeMenuButton.frame = CGRect(x: 0, y: 80, width: 100, height: 20)
        homeMenuButton.sizeToFit()
        homeMenuButton.frame.origin.x = 10
        homeMenuButton.accessibilityIdentifier = "1"
        
        // 'birthdayMenuButton'
        let birthdayMenuButtonAT = NSMutableAttributedString(string: "- Birthday", attributes: [NSAttributedStringKey.foregroundColor: colors[1], NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        birthdayMenuButton.setAttributedTitle(birthdayMenuButtonAT, for: .normal)
        birthdayMenuButton.backgroundColor = UIColor.clear
        birthdayMenuButton.frame = CGRect(x: 0, y: 140, width: 100, height: 20)
        birthdayMenuButton.sizeToFit()
        birthdayMenuButton.frame.origin.x = 20
        birthdayMenuButton.accessibilityIdentifier = "2"
        
        // 'sesonalMenuButton'
        let sesonalMenuButtonAT = NSMutableAttributedString(string: "- Sesonal", attributes: [NSAttributedStringKey.foregroundColor: colors[2], NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        sesonalMenuButton.setAttributedTitle(sesonalMenuButtonAT, for: .normal)
        sesonalMenuButton.backgroundColor = UIColor.clear
        sesonalMenuButton.frame = CGRect(x: 0, y: 180, width: 100, height: 20)
        sesonalMenuButton.sizeToFit()
        sesonalMenuButton.frame.origin.x = 20
        sesonalMenuButton.accessibilityIdentifier = "3"
        
        // 'holidayMenuButton'
        let holidayMenuButtonAT = NSMutableAttributedString(string: "- Holiday", attributes: [NSAttributedStringKey.foregroundColor: colors[3], NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        holidayMenuButton.setAttributedTitle(holidayMenuButtonAT, for: .normal)
        holidayMenuButton.backgroundColor = UIColor.clear
        holidayMenuButton.frame = CGRect(x: 0, y: 220, width: 100, height: 20)
        holidayMenuButton.sizeToFit()
        holidayMenuButton.frame.origin.x = 20
        holidayMenuButton.accessibilityIdentifier = "4"
        
        // 'sportsMenuButton'
        let sportsMenuButtonAT = NSMutableAttributedString(string: "- Sports", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        sportsMenuButton.setAttributedTitle(sportsMenuButtonAT, for: .normal)
        sportsMenuButton.backgroundColor = UIColor.clear
        sportsMenuButton.frame = CGRect(x: 0, y: 260, width: 100, height: 20)
        sportsMenuButton.sizeToFit()
        sportsMenuButton.frame.origin.x = 20
        sportsMenuButton.accessibilityIdentifier = "5"
        
        // 'congratsMenuButton'
        let congratsMenuButtonAT = NSMutableAttributedString(string: "- Congrats", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        congratsMenuButton.setAttributedTitle(congratsMenuButtonAT, for: .normal)
        congratsMenuButton.backgroundColor = UIColor.clear
        congratsMenuButton.frame = CGRect(x: 0, y: 300, width: 100, height: 20)
        congratsMenuButton.sizeToFit()
        congratsMenuButton.frame.origin.x = 20
        congratsMenuButton.accessibilityIdentifier = "6"
        
        // 'miscMenuButton'
        let miscMenuButtonAT = NSMutableAttributedString(string: "- Misc", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        miscMenuButton.setAttributedTitle(miscMenuButtonAT, for: .normal)
        miscMenuButton.backgroundColor = UIColor.clear
        miscMenuButton.frame = CGRect(x: 0, y: 340, width: 100, height: 20)
        miscMenuButton.sizeToFit()
        miscMenuButton.frame.origin.x = 20
        miscMenuButton.accessibilityIdentifier = "7"
        
        
        // 'logOutMenuButton'
        let logOutMenuButtonAT = NSMutableAttributedString(string: "Log Out", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 24) as Any])
        logOutMenuButton.setAttributedTitle(logOutMenuButtonAT, for: .normal)
        logOutMenuButton.backgroundColor = UIColor.clear
        logOutMenuButton.frame = CGRect(x: 0, y: 640, width: 100, height: 20)
        logOutMenuButton.sizeToFit()
        logOutMenuButton.center.x = (self.view.frame.width/4)
        
        
        // Add Subview's to Main View
        self.view.addSubview(menuView)
        
        // Add Subview's for Menu
        menuView.addSubview(circleView)
        menuView.addSubview(homeMenuButton)
        menuView.addSubview(birthdayMenuButton)
        menuView.addSubview(sesonalMenuButton)
        menuView.addSubview(holidayMenuButton)
        menuView.addSubview(sportsMenuButton)
        menuView.addSubview(congratsMenuButton)
        menuView.addSubview(miscMenuButton)
        menuView.addSubview(logOutMenuButton)
        
        // Setup 'circleView'
        var center: CGFloat!
        var centers = [homeMenuButton.center.y, birthdayMenuButton.center.y, sesonalMenuButton.center.y, holidayMenuButton.center.y]
        if identifiers.contains(identifier) {
            let index = identifiers.index(of: identifier)
            center = centers[index!]
        }
        circleView.center.y = center
    }
    
    
    
    ///////////////////////////////////////////////// MARK: Menu Button Function
    
    @objc func menuButtonTapped(_ sender: UIButton) {
        
        print("Second Menu Button Tapped!")
        
        // Setup Main View
        closeMenuButton.setImage(UIImage(named: "whiteX"), for: .normal)
        closeMenuButton.alpha = 1
        blurView.alpha = 1
        
        // Main View Animation
        UIView.animate(withDuration: 0.5, animations: {
            self.view.addSubview(self.blurView)
            self.view.addSubview(self.closeMenuButton)
            self.addedAnimation()
        }, completion: nil)
    }
    
    
    
    ///////////////////////////////////////////////// MARK: Dismiss Menu Function
    
    @objc func dismissNavMenu(_ sender: UIButton) {
        
        print("Close Menu!")
        closeMenuButton.setImage(UIImage(named: "whiteX2"), for: .normal)
        
        UIView.animate(withDuration: 0.7) {
            self.blurView.alpha = 0
            self.closeMenuButton.alpha = 0
            self.menuView.frame.origin.x = -200
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
    
    
    
    
    
////////// End Of Class
}


