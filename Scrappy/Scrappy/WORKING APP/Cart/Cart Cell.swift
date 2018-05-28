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
        guard let aPrice = cellPrice else { return }
        guard let aD = cellDescription else { return }
        
        // Set Cell Frame
        self.frame = frame
        
        // 'aboveLine'
        aboveLine.backgroundColor = UIColor.orange
        aboveLine.frame = CGRect(x: 10, y: 20, width: self.frame.width - 10, height: 2)
        aboveLine.layer.cornerRadius = 10
        
        // 'itPhoto'
        itPhoto.backgroundColor = UIColor.clear
        itPhoto.image = aImage
        itPhoto.frame = CGRect(x: 20, y: 0, width: 40, height: 40)
        itPhoto.center.y = (self.center.y + 20)
        
        // 'itName'
        let itNameAT = NSMutableAttributedString(string: aName, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        itName.attributedText = itNameAT
        itName.backgroundColor = UIColor.clear
        itName.frame = CGRect(x: 100, y: 0, width: 100, height: 20)
        itName.sizeToFit()
        itName.textAlignment = .center
        itName.center.y = (self.center.y + 10)
        
        // 'itPrice'
        let itPriceAT = NSMutableAttributedString(string: "$ \(aPrice)", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Regular", size: 14) as Any])
        itPrice.attributedText = itPriceAT
        itPrice.backgroundColor = UIColor.clear
        itPrice.frame = CGRect(x: 100, y: 0, width: 100, height: 20)
        itPrice.sizeToFit()
        itPrice.textAlignment = .center
        itPrice.center.y = (self.center.y + 40)
        itPrice.alpha = 0.8
        
        
        
        ////////// Add Subview's
        self.addSubview(aboveLine)
        self.addSubview(itPhoto)
        self.addSubview(itName)
        self.addSubview(itPrice)
        
    }
    
    
}
