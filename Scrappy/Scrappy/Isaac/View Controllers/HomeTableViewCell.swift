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
    var cellBackgroundImage: UIImage?
    var cellColor: UIColor?
    var cellName: String?
    
    // Cell
    let backgroundImageView = UIImageView()
    let cellColorView = UIView()
    let cellNameLabel = UILabel()
    let cellButton = UIButton()
    
    ///////////////////////////////////////////////// MARK: 'SetupCellUI' Function
    
    func setupCellUI(cellFrame: CGRect) {
        
        // Set Cell Frame
        self.frame = cellFrame
        
        // Unwrap Optional(s)
        guard let bImage = cellBackgroundImage else { return }
        guard let color = cellColor else { return }
        guard let name = cellName else { return }
        
        
        // 'backgroundImageView'
        backgroundImageView.frame = self.frame
        backgroundImageView.image = bImage
        
        // 'cellColorView'
        cellColorView.frame = self.frame
        cellColorView.backgroundColor = color
        
        // 'cellNameLabel'
        let cellNameLabelAT = NSMutableAttributedString(string: name, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Bold", size: 32) as Any])
        cellNameLabel.attributedText = cellNameLabelAT
        cellNameLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        cellNameLabel.sizeToFit()
        cellNameLabel.center.x = self.center.x
        cellNameLabel.center.y = self.center.y
        
        // 'cellButton'
        cellButton.frame = self.frame
        cellButton.backgroundColor = UIColor.clear
        
        /////////// Add Subview's
        self.addSubview(backgroundImageView)
        self.addSubview(cellColorView)
        self.addSubview(cellNameLabel)
        self.addSubview(cellButton)
    }
    

}
