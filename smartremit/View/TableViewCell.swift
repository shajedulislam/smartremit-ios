//
//  TableViewCell.swift
//  ListTest1
//
//  Created by Marium Binte Ibrahim on 2/14/19.
//  Copyright © 2019 marium. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
   // @IBOutlet var label_name: UILabel!
    
   // @IBOutlet var label_trnsHistory: UILabel!
    // @IBOutlet var sent: UILabel!
   
    @IBOutlet var label_name: UILabel!
    @IBOutlet var label_trnsHistory: UILabel!
    @IBOutlet weak var updateBtn: UIButton!
    @IBOutlet var sent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
