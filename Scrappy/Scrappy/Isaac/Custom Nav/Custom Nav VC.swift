//
//  CustomNavigationViewController.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/15/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class CustomNavigationViewController: UIViewController {

    ///////////////////////////////////////////////// MARK: Local Properties
    
    // Blur View
    var blurView = UIVisualEffectView()
    let closeMenuButton = UIButton()
    
    // Nav Menu
    let menuView = UIView()
    let circleView = UIView()
    
    //////////////// Nav Menu Button(s)
    
    // Home
    let homeMenuButton = UIButton()
    
    // Category(s)
    let birthdayMenuButton = UIButton()
    let sesonalMenuButton = UIButton()
    let holidayMenuButton = UIButton()
    let sportsMenuButton = UIButton()
    let congratsMenuButton = UIButton()
    let miscMenuButton = UIButton()
    
    // Profile
    let profileImage = UIImageView()
    let profileButton = UIButton()
    
    // Log Out
    let logOutMenuButton = UIButton()

    
    ///////////////////////////////////////////////// MARK: Setup Nav Menu View's Function
    
    func setupUI(view: UIViewController) {
        
        // Setup Button Colors
        guard let identifier = view.accessibilityValue else { return }
        let identifiers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
        var colors = [UIColor.white, UIColor.white, UIColor.white, UIColor.white, UIColor.white, UIColor.white, UIColor.white, UIColor.white, UIColor.white, UIColor.white]
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
        let sportsMenuButtonAT = NSMutableAttributedString(string: "- Sports", attributes: [NSAttributedStringKey.foregroundColor: colors[4], NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        sportsMenuButton.setAttributedTitle(sportsMenuButtonAT, for: .normal)
        sportsMenuButton.backgroundColor = UIColor.clear
        sportsMenuButton.frame = CGRect(x: 0, y: 260, width: 100, height: 20)
        sportsMenuButton.sizeToFit()
        sportsMenuButton.frame.origin.x = 20
        sportsMenuButton.accessibilityIdentifier = "5"
        
        // 'congratsMenuButton'
        let congratsMenuButtonAT = NSMutableAttributedString(string: "- Congrats", attributes: [NSAttributedStringKey.foregroundColor: colors[5], NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        congratsMenuButton.setAttributedTitle(congratsMenuButtonAT, for: .normal)
        congratsMenuButton.backgroundColor = UIColor.clear
        congratsMenuButton.frame = CGRect(x: 0, y: 300, width: 100, height: 20)
        congratsMenuButton.sizeToFit()
        congratsMenuButton.frame.origin.x = 20
        congratsMenuButton.accessibilityIdentifier = "6"
        
        // 'miscMenuButton'
        let miscMenuButtonAT = NSMutableAttributedString(string: "- Misc", attributes: [NSAttributedStringKey.foregroundColor: colors[6], NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        miscMenuButton.setAttributedTitle(miscMenuButtonAT, for: .normal)
        miscMenuButton.backgroundColor = UIColor.clear
        miscMenuButton.frame = CGRect(x: 0, y: 340, width: 100, height: 20)
        miscMenuButton.sizeToFit()
        miscMenuButton.frame.origin.x = 20
        miscMenuButton.accessibilityIdentifier = "7"
        
        // 'profileImage'
        profileImage.image = UIImage(named: "mock6")
        profileImage.backgroundColor = UIColor.darkGray
        profileImage.frame = CGRect(x: 0, y: 480, width: 80, height: 80)
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = 40
        profileImage.layer.borderWidth = 2
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.center.x = (view.view.frame.width/4)
        
        // 'profileButton'
        profileButton.backgroundColor = UIColor.clear
        profileButton.frame = CGRect(x: 0, y: 480, width: 80, height: 80)
        profileButton.accessibilityIdentifier = "10"
        profileButton.center.x = (view.view.frame.width/4)
        
        
        // 'logOutMenuButton'
        let logOutMenuButtonAT = NSMutableAttributedString(string: "  Log Out  ", attributes: [NSAttributedStringKey.foregroundColor: colors[7], NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 24) as Any])
        logOutMenuButton.setAttributedTitle(logOutMenuButtonAT, for: .normal)
        logOutMenuButton.backgroundColor = UIColor.clear
        logOutMenuButton.layer.cornerRadius = 8
        logOutMenuButton.layer.borderColor = UIColor.white.cgColor
        logOutMenuButton.layer.borderWidth = 2
        logOutMenuButton.frame = CGRect(x: 0, y: 660, width: 100, height: 20)
        logOutMenuButton.sizeToFit()
        logOutMenuButton.center.x = (self.view.frame.width/4)
        logOutMenuButton.accessibilityIdentifier = "0"
        
        
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
        menuView.addSubview(profileImage)
        menuView.addSubview(profileButton)
        menuView.addSubview(logOutMenuButton)
        
        // Setup 'circleView'
        var center: CGFloat!
        var centers = [homeMenuButton.center.y, birthdayMenuButton.center.y, sesonalMenuButton.center.y, holidayMenuButton.center.y, sportsMenuButton.center.y, congratsMenuButton.center.y, miscMenuButton.center.y, logOutMenuButton.center.y, logOutMenuButton.center.y, profileButton.center.y]
        if identifiers.contains(identifier) {
            let index = identifiers.index(of: identifier)
            center = centers[index!]
        }
        if center != nil {
            circleView.center.y = center
        }
    }
    
    
    ///////////////////////////////////////////////// MARK: Menu Button Function
    
    @objc func menuButtonTapped(_ sender: UIButton) {
        
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
    
    
    ///////////////////////////////////////////////// MARK: Highlight Button Function (Home VC Only)
    
//    func highlightButton(_ id: String) {
//        var button: UIButton!
//        let buttons = [self.homeMenuButton, self.birthdayMenuButton, self.sesonalMenuButton, self.holidayMenuButton, self.sportsMenuButton, self.congratsMenuButton, self.miscMenuButton, self.logOutMenuButton]
//        let identifiers = ["1", "2", "3", "4", "5", "6", "7", "8"]
//        if identifiers.contains(id) {
//            guard let index = identifiers.index(of: id) else { return }
//            button = buttons[index]
//        }
//
//        // Animate Button Color's
//        UIView.animate(withDuration: 0.5, animations: {
//            button.setTitleColor(UIColor.blue, for: .normal)
//        }) { (succes) in
//            if succes {
//                button.setTitleColor(UIColor.white, for: .normal)
//            }
//        }
//    }
    
    
////////// End Of Class
}

