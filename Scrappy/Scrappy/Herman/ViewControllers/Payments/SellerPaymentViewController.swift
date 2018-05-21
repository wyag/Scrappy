//
//  SellerPaymentViewController.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/18/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class SellerPaymentViewController: UIViewController {
    
    let sellerPaymentInputViews = SellerPaymentInputViews(frame: UIScreen.main.bounds)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(sellerPaymentInputViews)
        
        view.backgroundColor = UIColor.white
    }
}
