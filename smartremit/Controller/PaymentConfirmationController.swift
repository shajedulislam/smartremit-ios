//
//  PaymentConfirmationController.swift
//  smartremit
//
//  Created by Demo User on 26/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class PaymentConfirmationController: UIViewController {

    @IBOutlet weak var menuBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.rightRevealToggle(_:)), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backBtnTapped(_ sender: Any) {
        self.revealViewController().rightViewController.performSegue(withIdentifier: "RemittanceSum", sender: self.revealViewController().rightViewController)
    }
    @IBAction func submitBtnTapped(_ sender: Any) {
        self.revealViewController().rightViewController.performSegue(withIdentifier: "PaymentError", sender: self.revealViewController().rightViewController)
    }
    
}
