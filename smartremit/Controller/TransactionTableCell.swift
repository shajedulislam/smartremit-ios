//
//  TransactionTableCell.swift
//  smartremit
//
//  Created by Shajedul Islam on 7/3/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class TransactionTableCell: UITableViewCell {
    
    @IBOutlet weak var referenceNoLabel: UILabel!
    @IBOutlet weak var beneficiaryLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusColorBar: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
