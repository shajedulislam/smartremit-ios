//
//  Login_verificationController.swift
//  Smart Remit
//
//  Created by Shajedul Islam on 16/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class Login_verificationController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var verificationTxtFieldOne: CustomTextFieldHalfRound!
    @IBOutlet weak var verificationTxtFieldTwo: CustomTextFieldHalfRound!
    @IBOutlet weak var verificationTxtFieldThree: CustomTextFieldHalfRound!
    @IBOutlet weak var verificationTxtFieldFour: CustomTextFieldHalfRound!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (textField == verificationTxtFieldOne || textField == verificationTxtFieldTwo || textField == verificationTxtFieldThree || textField == verificationTxtFieldFour) {
            let allowedCharacters = CharacterSet(charactersIn:"0123456789")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
    
    
    
    
    
    @IBAction func toMoveNextFieldAndVerify(_ sender: UITextField) {
        if((sender.text?.count)! < 2 && (sender.text?.count)! > 0 )
        {
            if(sender == verificationTxtFieldOne)
            {
                verificationTxtFieldTwo.becomeFirstResponder()
            }
            else if(sender == verificationTxtFieldTwo)
            {
                verificationTxtFieldThree.becomeFirstResponder()
            }
            else if(sender == verificationTxtFieldThree)
            {
                verificationTxtFieldFour.becomeFirstResponder()
            }
            else if(sender == verificationTxtFieldFour)
            {
                UserDefaults.standard.set("verDone", forKey: "verDone")
                
                NotificationCenter.default.post(name: NSNotification.Name("enableSideBarOptions"), object: nil)
                
                self.revealViewController().rightViewController.performSegue(withIdentifier: "BeneficiaryList", sender: self.revealViewController().rightViewController)
            }
        }
        else
        {
            sender.deleteBackward()
        }
    }
    
    @IBAction func resendCode(_ sender: Any) {
        verificationTxtFieldOne.text = ""
        verificationTxtFieldTwo.text = ""
        verificationTxtFieldThree.text = ""
        verificationTxtFieldFour.text = ""
        
        verificationTxtFieldOne.becomeFirstResponder()
    }
    

}
