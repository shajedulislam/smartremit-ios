//
//  CustomLineByView.swift
//  smartremit
//
//  Created by Shajedul Islam on 19/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class CustomLineByView: UIView {

    override func awakeFromNib() {
        layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.shadowOpacity = 0.60
        layer.shadowRadius = 6
        //layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        //layer.borderWidth = 2
        layer.cornerRadius = layer.frame.height/2
    }

        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
