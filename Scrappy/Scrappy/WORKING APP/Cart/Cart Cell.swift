//
//  CartTableViewCell.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/18/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    ///////////////////////////////////////////////////////////// MARK: Cell Properties
    
    // Data Properties
    var cellImage: UIImage?
    var cellName: String?
    var cellPrice: Int?
    var cellDescription: String?
    
    // View properties
    let aboveLine = UIView()
    let itPhoto = UIImageView()
    let itName = UILabel()
    let itPrice = UILabel()
    let itDescription = UITextView()
    let itAmount = UITextField()
    let itCheckout = UIButton()
    

    
    ///////////////////////////////////////////////////////////// MARK: Setup UI Function

    func setupCell(frame: CGRect) {
        
        // Unwrap Optionals
        guard let aImage = cellImage else { return }
        guard let aName = cellName else { return }
        guard let thePrice = cellPrice else { return }
        let aPrice = thePrice
        
        // Set Cell Frame
        self.frame = frame
        
        // 'itPhoto'
        itPhoto.backgroundColor = UIColor.clear
        itPhoto.image = aImage
        itPhoto.frame = CGRect(x: 10, y: 0, width: 80, height: 80)
        itPhoto.center.y = self.center.y
        itPhoto.layer.cornerRadius = 20
        itPhoto.clipsToBounds = true
        
        
        // 'itName'
        let itNameAT = NSMutableAttributedString(string: aName, attributes: [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        itName.attributedText = itNameAT
        itName.backgroundColor = UIColor.clear
        itName.frame = CGRect(x: 120, y: 0, width: 100, height: 20)
        itName.sizeToFit()
        itName.textAlignment = .center
        itName.frame.origin.y = itPhoto.frame.origin.y
        
        // 'itPrice'
        let itPriceAT = NSMutableAttributedString(string: "$ \(aPrice)", attributes: [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Regular", size: 14) as Any])
        itPrice.attributedText = itPriceAT
        itPrice.backgroundColor = UIColor.clear
        itPrice.frame = CGRect(x: 120, y: 0, width: 100, height: 20)
        itPrice.sizeToFit()
        itPrice.textAlignment = .center
        itPrice.frame.origin.y = itPhoto.center.y
        itPrice.alpha = 0.8
        
        
        
        ////////// Add Subview's
        self.addSubview(aboveLine)
        self.addSubview(itPhoto)
        self.addSubview(itName)
        self.addSubview(itPrice)
    }
    
    
}
