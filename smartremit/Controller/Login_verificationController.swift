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
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    @IBAction func VerificationDone(_ sender: Any) {
        
        UserDefaults.standard.set("verDone", forKey: "verDone")
        
        NotificationCenter.default.post(name: NSNotification.Name("enableSideBarOptions"), object: nil)

        self.revealViewController().rightViewController.performSegue(withIdentifier: "BeneficiaryList", sender: self.revealViewController().rightViewController)
    }
    
  

}
