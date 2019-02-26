//
//  CustomeImageViewDesign.swift
//  smartremit
//
//  Created by Shajedul Islam on 18/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class CustomeImageViewDesign: UIImageView {

    override func awakeFromNib() {
        
        layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.shadowOpacity = 0.60
        layer.shadowRadius = 6
        layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.borderWidth = 2
        layer.cornerRadius = 10
        
        
        
        
    }

}
