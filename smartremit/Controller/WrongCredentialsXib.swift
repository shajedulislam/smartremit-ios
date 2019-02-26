//
//  WrongCredentialsXib.swift
//  smartremit
//
//  Created by Shajedul Islam on 23/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class WrongCredentialsXib: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func okPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
