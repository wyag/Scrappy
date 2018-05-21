//
//  HomeTableViewCell.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/16/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    ///////////////////////////////////////////////// MARK: Local Properties
    
    // Optionals
    var cellIconImage: UIImage?
    var cellColor: UIColor?
    var cellName: String?
    
    // Cell
    let cellColorView = UIView()
    let cellIconImageView = UIImageView()
    let cellNameLabel = UILabel()
    let cellArrowImageView = UIImageView()
    let cellButton = UIButton()
    
    ///////////////////////////////////////////////// MARK: 'SetupCellUI' Function
    
    func setupCellUI(cellFrame: CGRect) {
        
        // Set Cell Frame
        self.frame = cellFrame
        
        // Unwrap Optional(s)
        guard let iconImage = cellIconImage else { return }
        guard let color = cellColor else { return }
        guard let name = cellName else { return }
        
        // 'cellColorView'
        cellColorView.frame = self.frame
        cellColorView.backgroundColor = color
        
        // 'cellIconImageView'
        cellIconImageView.image = iconImage
        cellIconImageView.frame = CGRect(x: 60, y: 0, width: 40, height: 40)
        cellIconImageView.center.y = self.center.y
        
        // 'cellNameLabel'
        let cellNameLabelAT = NSMutableAttributedString(string: name, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Bold", size: 32) as Any])
        cellNameLabel.attributedText = cellNameLabelAT
        cellNameLabel.frame = CGRect(x: 120, y: 0, width: 100, height: 20)
        cellNameLabel.sizeToFit()
        cellNameLabel.center.x = self.center.x
        cellNameLabel.center.y = self.center.y
        
        // 'cellArrowImageView'
        cellArrowImageView.image = UIImage(named: "whitearrow")
        cellArrowImageView.frame = CGRect(x: 340, y: 0, width: 30, height: 30)
        cellArrowImageView.center.y = self.center.y
        
        // 'cellButton'
        cellButton.frame = self.frame
        cellButton.backgroundColor = UIColor.clear
        
        /////////// Add Subview's
        self.addSubview(cellColorView)
        self.addSubview(cellIconImageView)
        self.addSubview(cellNameLabel)
        self.addSubview(cellArrowImageView)
        self.addSubview(cellButton)
    }
    

}
