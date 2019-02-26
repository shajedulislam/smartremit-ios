//
//  CustomButtonHalfRoundedPink.swift
//  smartremit
//
//  Created by Shajedul Islam on 17/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class CustomButtonHalfRoundedPink: UIButton {

    override func awakeFromNib() {
        
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowOpacity = 0.50
        layer.borderColor = #colorLiteral(red: 0.9662465453, green: 0, blue: 1, alpha: 0.69921875)
        layer.borderWidth = 2
        layer.cornerRadius = 5
        
        
    }

}
