//
//  BankDetailsController.swift
//  smartremit
//
//  Created by Shajedul Islam on 18/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class BankDetailsController: UIViewController{
    
    @IBOutlet weak var menuBtn: UIButton!
    
    @IBOutlet weak var choosePurposeLabel: UILabel!
    @IBOutlet weak var chooseMethodLabel: UILabel!
    @IBOutlet weak var chooseBankLabel: UILabel!
    @IBOutlet weak var chooseDistrictLabel: UILabel!
    @IBOutlet weak var chooseBranchLabel: UILabel!
    @IBOutlet weak var chooseAccountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.rightRevealToggle(_:)), for: .touchUpInside)

    }
  
    
    //------------------Button Action Functions
    
    @IBAction func BackBtnToBenList(_ sender: Any) {
        
        self.revealViewController().rightViewController.performSegue(withIdentifier: "BeneficiaryList", sender: self.revealViewController().rightViewController)
    }
    
    @IBAction func chooseForAllBtnTapped(_ sender: UIButton) {
        
        if(sender.titleLabel?.text == "purpose")
        {
            optionReceiver(optionName: "purpose")
        }
        else if(sender.titleLabel?.text == "method")
        {
            optionReceiver(optionName: "method")
        }
        else if(sender.titleLabel?.text == "bank")
        {
            optionReceiver(optionName: "bank")
        }
        else if(sender.titleLabel?.text == "district")
        {
            optionReceiver(optionName: "district")
        }
        else if(sender.titleLabel?.text == "branch")
        {
            optionReceiver(optionName: "branch")
        }
        else if(sender.titleLabel?.text == "account")
        {
            optionReceiver(optionName: "account")
        }
        
    }
    
    @IBAction func continueBtnPressed(_ sender: Any) {
        self.revealViewController().rightViewController.performSegue(withIdentifier: "RemittanceSum", sender: self.revealViewController().rightViewController)
    }
    
    //----------------Custom Functiins
    
    func optionReceiver(optionName : String) {

        let sb = UIStoryboard(name: "BankDetailsOptionPopup", bundle: nil)
        
        let popup = sb.instantiateInitialViewController()! as! BankDetailsOptionPopupController
        popup.optionToShow = optionName
        
        self.present(popup, animated: true)
        
        popup.onDone = { (data) in
       
        
        if(optionName == "purpose")
        {
            self.choosePurposeLabel.text = data
        }
        else if(optionName == "method")
        {
            self.chooseMethodLabel.text = data
        }
        else if(optionName == "bank")
        {
            self.chooseBankLabel.text = data
        }
        else if(optionName == "district")
        {
            self.chooseDistrictLabel.text = data
        }
        else if(optionName == "branch")
        {
            self.chooseBranchLabel.text = data
        }
        else if(optionName == "account")
        {
            self.chooseAccountLabel.text = data
        }
            

        }
    }
    
}
