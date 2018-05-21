//
//  IsaacAppViewController.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/14/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class ScrappyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black
        self.navigationController?.navigationBar.isHidden = true
        setupUI()
    }


    let menuView = CustomNavigationViewController()
    let menuButton = UIButton()
    
    
    func setupUI() {
        
        // 'menuButton'
        menuButton.frame = CGRect(x: self.view.frame.width/20.7, y: self.view.frame.height/36.8, width: self.view.frame.width/10.35, height: self.view.frame.width/10.35)
        menuButton.setBackgroundImage(UIImage(named: "hMenu"), for: .normal)
        menuButton.setBackgroundImage(UIImage(named: "hMenu"), for: .highlighted)
        menuButton.setBackgroundImage(UIImage(named: "hMenu"), for: .selected)
        menuButton.addTarget(self, action: #selector(self.menuOpen(_:)), for: .touchDown)
        
        // 'menuView'
        menuView.view.frame = self.view.frame
        menuView.view.alpha = 1
        menuView.setupUI(view: self)
        menuView.closeMenuButton.addTarget(self, action: #selector(self.dismissMenu(_:)), for: .touchUpInside)
        
        self.view.addSubview(menuView.view)
        self.view.addSubview(menuButton)
    }
    
    
    
    
    @objc private func menuOpen(_ sender: UIButton) {
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
