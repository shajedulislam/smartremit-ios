//
//  Login_verificationController.swift
//  Smart Remit
//
//  Created by Shajedul Islam on 16/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class Login_verificationController: UIViewController {

 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func VerificationDone(_ sender: Any) {
        
        self.revealViewController().rightViewController.performSegue(withIdentifier: "BeneficiaryList", sender: self.revealViewController().rightViewController)
    }
    
  

}