//
//  CustomButtonRounded.swift
//  Test3
//
//  Created by Shajedul Islam on 12/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class CustomButtonRounded: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = layer.frame.height/2
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.70
        //backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        //layer.borderColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        //layer.borderWidth = 5
    }
        


}
