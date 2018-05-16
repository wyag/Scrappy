//
//  UIImageViewEx.swift
//  Scrappy
//
//  Created by Isaac Gonzalez on 5/16/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
