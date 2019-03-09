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
    
    let oneGBPtoBDT:Double = 110.00

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        oneGBPequalLabel.text = "1 GBP = \(oneGBPtoBDT) BDT"
    }
    
    @IBAction func BDTGBPclick(_ sender: Any)
    {
        let beforeChangeValue = BDTbutton.titleLabel?.text
        
        let sb = UIStoryboard(name: "OptionPopup", bundle: nil)
        
        let popup = sb.instantiateInitialViewController()! as! OptionPopupController
        popup.optionToShow = "BDTGBP"
        
        self.present(popup, animated: true)
        
        popup.onDone = { (data) in
            
            if(data == "BDT")
            {
                self.BDTbutton.setTitle("BDT", for: .normal)
                self.GBPbutton.setTitle("GBP", for: .normal)
            }
            else if (data == "GBP")
            {
                self.BDTbutton.setTitle("GBP", for: .normal)
                self.GBPbutton.setTitle("BDT", for: .normal)
            }
            
            
            if(beforeChangeValue != data)
            {
                self.benificiaryGetsTxtField.text = ""
                self.youPayTxtField.text = ""
            }
        }
        
    }
    @IBAction func GBPBDTclick(_ sender: Any) {
        
        let beforeChangeValue = GBPbutton.titleLabel?.text
        
        let sb = UIStoryboard(name: "OptionPopup", bundle: nil)
        
        let popup = sb.instantiateInitialViewController()! as! OptionPopupController
        popup.optionToShow = "BDTGBP"
        
        self.present(popup, animated: true)
        
        popup.onDone = { (data) in
            
            if(data == "BDT")
            {
                self.GBPbutton.setTitle("BDT", for: .normal)
                self.BDTbutton.setTitle("GBP", for: .normal)
            }
            else if (data == "GBP")
            {
                self.GBPbutton.setTitle("GBP", for: .normal)
                self.BDTbutton.setTitle("BDT", for: .normal)
            }
            
            if(beforeChangeValue != data)
            {
                self.benificiaryGetsTxtField.text = ""
                self.youPayTxtField.text = ""
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (textField == benificiaryGetsTxtField || textField == youPayTxtField ) {
            let allowedCharacters = CharacterSet(charactersIn:"0123456789.")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
    
    @IBAction func getStartedBtn(_ sender: Any) {
        performSegue(withIdentifier: "Login", sender: nil)
    }
    
    @IBAction func beneficiaryGetsTxtFieldEditing(_ sender: Any) {
        
        let countdots =  (benificiaryGetsTxtField.text?.components(separatedBy: (".")).count)! - 1
        
        if(BDTbutton.titleLabel?.text == "BDT")
        {
            if(benificiaryGetsTxtField.text != "" && countdots < 2)
            {
                let benGets = Double(benificiaryGetsTxtField.text!)! / oneGBPtoBDT
                
                youPayTxtField.text = String(format: "%.2f", benGets)
            }
            else
            {
                youPayTxtField.text = ""
            }
        }
        else if(BDTbutton.titleLabel?.text == "GBP")
        {
            if(benificiaryGetsTxtField.text != "" && countdots < 2)
            {
                let benGets = Double(benificiaryGetsTxtField.text!)! * oneGBPtoBDT
                
                youPayTxtField.text = String(format: "%.2f", benGets)
            }
            else
            {
                youPayTxtField.text = ""
            }
        }
    }
    @IBAction func youPayTxtFieldEditing(_ sender: Any) {
        
        let countdots =  (youPayTxtField.text?.components(separatedBy: (".")).count)! - 1
        
        if(GBPbutton.titleLabel?.text == "BDT")
        {
            if(youPayTxtField.text != "" && countdots < 2)
            {
                let youPay = Double(youPayTxtField.text!)! / oneGBPtoBDT
                
                benificiaryGetsTxtField.text = String(format: "%.2f", youPay)
            }
            else
            {
                benificiaryGetsTxtField.text = ""
            }
        }
        else if(GBPbutton.titleLabel?.text == "GBP" )
        {
            if(youPayTxtField.text != "" && countdots < 2)
            {
                let youPay = Double(youPayTxtField.text!)! * oneGBPtoBDT
                
                benificiaryGetsTxtField.text = String(format: "%.2f", youPay)
            }
            else
            {
                benificiaryGetsTxtField.text = ""
            }
        }
    }

}

