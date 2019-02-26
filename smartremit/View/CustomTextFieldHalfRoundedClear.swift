//
//  CustomTextFieldHalfRoundedClear.swift
//  smartremit
//
//  Created by Shajedul Islam on 19/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class CustomTextFieldHalfRoundedClear: UITextField {

    override func awakeFromNib() {
        
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowOpacity = 0.50
        layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.borderWidth = 2
        layer.cornerRadius = 5
        layer.backgroundColor = nil
        
        
        
        
        
    }

}
