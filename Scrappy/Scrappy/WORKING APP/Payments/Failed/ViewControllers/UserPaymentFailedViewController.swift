//
//  UserPaymentFailedViewController.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/24/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class UserPaymentFailedViewController: UIViewController {

    let userPaymentFailedInputViews = UserPaymentFailedInputViews(frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(userPaymentFailedInputViews)
        
        view.backgroundColor = UIColor.clear
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(popUpViewTappedGesture))
        userPaymentFailedInputViews.popUpView.addGestureRecognizer(tapGesture)
    }
    
    @objc func popUpViewTappedGesture() {
        dismiss(animated: true, completion: nil)
    }
}
