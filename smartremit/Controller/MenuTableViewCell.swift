//
//  MenuTableViewCell.swift
//  Smart Remit
//
//  Created by Shajedul Islam on 16/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var menuOptionName: UILabel!
    
    @IBOutlet weak var menuOptionIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
