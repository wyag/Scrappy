//
//  SellerPaymentInputViews.swift
//  Scrappy
//
//  Created by Herman Kwan on 5/19/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class SellerPaymentInputViews: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cardNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Card Number Here"
        return textField
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
}
