//
//  ViewController.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/14/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresentButton()
        self.view.backgroundColor = UIColor.orange
    }
    
    let presentButton = UIButton(type: .system)
    
    func setupPresentButton() {
        view.addSubview(presentButton)
        
        presentButton.setTitle("Testing", for: .normal)
        presentButton.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
        
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        presentButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func presentButtonTapped() {
        present(BlankViewController(), animated: true, completion: nil)
    }
}

