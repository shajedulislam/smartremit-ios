//
//  GetstartedController.swift
//  Smart Remit
//
//  Created by Shajedul Islam on 14/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class GetstartedController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var oneGBPequalLabel: UILabel!
    @IBOutlet weak var BDTbutton: CustomButtonHalfRounded!
    @IBOutlet weak var GBPbutton: CustomButtonHalfRounded!
    @IBOutlet weak var benificiaryGetsTxtField: CustomTextFieldHalfRound!
    @IBOutlet weak var youPayTxtField: CustomTextFieldHalfRound!
    @IBOutlet weak var feesLabelGetStarted: UILabel!
    
    var oneGBPtoBDT = 110
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        oneGBPequalLabel.text = "1 GBP = \(oneGBPtoBDT) BDT"
    }
    
    @IBAction func BDTGBPclick(_ sender: UIButton)
    {
        if(sender.titleLabel?.text == "BDT")
        {
            
        }
        else if(sender.titleLabel?.text == "GBP")
        {
            
        }
    }
    
    @IBAction func getStartedBtn(_ sender: Any) {
        performSegue(withIdentifier: "Login", sender: nil)
    }
    
    @IBAction func beneficiaryGetsTxtFieldEditing(_ sender: Any) {
        print("Ben Gets on edit")
    }
    @IBAction func youPayTxtFieldEditing(_ sender: Any) {
        print("You pay on edit")
    }
    
    func optionReceivier(optionName : String)
    {
        
    }
    
}

