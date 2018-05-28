//
//  UserPaymentCompleteViewController.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/18/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class UserPaymentCompleteViewController: UIViewController {
    
    let userPaymentCompleteInputViews = UserPaymentCompleteInputViews(frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(userPaymentCompleteInputViews)
        
        view.backgroundColor = UIColor.clear
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(popUpViewTappedGesture))
        userPaymentCompleteInputViews.popUpView.addGestureRecognizer(tapGesture)
    }
    
    @objc func popUpViewTappedGesture() {
        dismiss(animated: true, completion: nil)
    }
}


