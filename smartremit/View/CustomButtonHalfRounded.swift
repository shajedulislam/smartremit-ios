//
//  CustomButtonHalfRounded.swift
//  Smart Remit
//
//  Created by Shajedul Islam on 15/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class CustomButtonHalfRounded: UIButton {
    
    override func awakeFromNib() {
        
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowOpacity = 0.50
        layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.borderWidth = 2
        layer.cornerRadius = 5
        
        
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
