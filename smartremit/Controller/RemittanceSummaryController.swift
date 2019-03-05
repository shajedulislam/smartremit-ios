//
//  RemittanceSummaryController.swift
//  smartremit
//
//  Created by Shajedul Islam on 27/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class RemittanceSummaryController: UIViewController {
  
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        menuBtn.target = revealViewController()
        menuBtn.action = #selector(SWRevealViewController.rightRevealToggle(_:))
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
        self.revealViewController().rightViewController.performSegue(withIdentifier: "BankDetails", sender: self.revealViewController().rightViewController)
    }
    
    @IBAction func preccedBtnTapped(_ sender: Any) {
        //self.revealViewController().rightViewController.performSegue(withIdentifier: "PaymentConfirmation", sender: self.revealViewController().rightViewController)
        performSegue(withIdentifier: "PaymentConfirmation", sender: nil)
    }
}
