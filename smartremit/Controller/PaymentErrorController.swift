//
//  PaymentErrorController.swift
//  smartremit
//
//  Created by Shajedul Islam on 27/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class PaymentErrorController: UIViewController {

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        menuBtn.target = revealViewController()
        menuBtn.action = #selector(SWRevealViewController.rightRevealToggle(_:))
    }
    
}
