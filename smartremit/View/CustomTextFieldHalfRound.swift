//
//  CustomTextFieldHalfRound.swift
//  Test3
//
//  Created by Shajedul Islam on 13/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class CustomTextFieldHalfRound: UITextField {
    
    override func awakeFromNib() {
        layer.cornerRadius = 5
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.50
        //layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        //layer.borderWidth = 2
   
        
        
        
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
