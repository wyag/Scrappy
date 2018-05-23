//
//  TestingHermanViewController.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/23/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import Stripe

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
        navigationController?.pushViewController(stripePaymentVC, animated: true)
    }
    
    func setupViews() {
        
        view.addSubview(testButton)
        testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        testButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension TestingHermanViewController: STPAddCardViewControllerDelegate {
    func addCardViewControllerDidCancel(_ addCardViewController: STPAddCardViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addCardViewController(_ addCardViewController: STPAddCardViewController, didCreateToken token: STPToken, completion: @escaping STPErrorBlock) {
//        StripeClient.shared.completeCharge(with: token, amount: 1000) { result in
//            switch result {
//            // 1
//            case .success:
//                completion(nil)
//                print("token is", token)
//
//                let alertController = UIAlertController(title: "Congrats",
//                                                        message: "Your payment was successful!",
//                                                        preferredStyle: .alert)
//                let alertAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
//                    self.navigationController?.popViewController(animated: true)
//                })
//                alertController.addAction(alertAction)
//                self.present(alertController, animated: true)
//            // 2
//            case .failure(let error):
//                completion(error)
//            }
//        }
    }
}




