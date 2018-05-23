//
//  TestingHermanViewController.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/23/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class TestingHermanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.yellow
        setupViews()
    }
    
    let testButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Test Button", for: .normal)
        button.backgroundColor = UIColor.green
        button.addTarget(self, action: #selector(testButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func testButtonTapped() {
        let stripePaymentVC = StripePaymentViewController()
//        let navVC = UINavigationController(rootViewController: stripePaymentVC)
        present(stripePaymentVC, animated: true, completion: nil)
    }
    
    func setupViews() {
        
        view.addSubview(testButton)
        testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        testButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
