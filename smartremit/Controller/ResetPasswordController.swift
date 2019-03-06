//
//  ResetPasswordController.swift
//  smartremit
//
//  Created by Shajedul Islam on 17/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class ResetPasswordController: UIViewController {
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBtn.target = revealViewController()
        menuBtn.action = #selector(SWRevealViewController.rightRevealToggle(_:))
        
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        //self.revealViewController()?.rightRevealToggle(self)
        
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(ResetPasswordController.back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
        
        UserDefaults.standard.set("granted", forKey: "RessetPasswordClick")
        
//        let customBackButton = UIBarButtonItem( image: UIImage(named: "backarrow") , style: .plain, target: self, action: #selector(back(sender:)))
//        customBackButton.imageInsets = UIEdgeInsets(top: 2, left: -8, bottom: 0, right: 0)
//        navigationItem.leftBarButtonItem = customBackButton
        
        
    }
    
    @objc func back(sender: UIBarButtonItem) {
        
        UserDefaults.standard.set("granted", forKey: "RessetPasswordClick")
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backBtnToBenList(_ sender: UIButton) {
        
        self.revealViewController().rightViewController.performSegue(withIdentifier: "BeneficiaryList", sender: self.revealViewController().rightViewController)
    }
  
}
