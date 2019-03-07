//
//  LabelShadow.swift
//  smartremit
//
//  Created by Shajedul Islam on 7/3/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class LabelShadow: UILabel {
    override func awakeFromNib() {
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowOpacity = 0.40
        layer.shadowRadius = 6
    }
}
