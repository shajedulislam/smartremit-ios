//
//  PaymentConfirmationController.swift
//  smartremit
//
//  Created by Demo User on 26/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class PaymentConfirmationController: UIViewController {

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBtn.target = revealViewController()
        menuBtn.action = #selector(SWRevealViewController.rightRevealToggle(_:))
        // Do any additional setup after loading the view.
    }
   
    @IBAction func submitBtnTapped(_ sender: Any) {
       performSegue(withIdentifier: "PaymentError", sender: nil)
    }
    
}
