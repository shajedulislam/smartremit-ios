//
//  LogoutController.swift
//  smartremit
//
//  Created by Shajedul Islam on 19/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class LogoutController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func LogoutCancel(_ sender: Any)
    {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func YesForLogout(_ sender: Any)
    {
        
        
    }
    
}
