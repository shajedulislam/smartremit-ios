//
//  GradientView.swift
//  Smart Remit
//
//  Created by Shajedul Islam on 16/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var topColor : UIColor = #colorLiteral(red: 0.8501734138, green: 0.06775268167, blue: 0.9520891309, alpha: 1){
    didSet{
        self.setNeedsLayout()
    
        }
    }
    
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.3646272719, green: 0, blue: 0.798419714, alpha: 1) {
        didSet{
            self.setNeedsLayout()
        }
    }
    
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    

    

}
