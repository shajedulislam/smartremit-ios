//
//  BankDetailsController.swift
//  smartremit
//
//  Created by Shajedul Islam on 18/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class BankDetailsController: UIViewController{
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    
    @IBOutlet weak var choosePurposeLabel: UILabel!
    @IBOutlet weak var chooseMethodLabel: UILabel!
    @IBOutlet weak var chooseBankLabel: UILabel!
    @IBOutlet weak var chooseDistrictLabel: UILabel!
    @IBOutlet weak var chooseBranchLabel: UILabel!
    @IBOutlet weak var chooseAccountLabel: UILabel!
    
    //The main stack for all
    
    @IBOutlet weak var the_main_stack: UIStackView!
    
    //row stacks of options
    
    
    @IBOutlet weak var purpose_method_stack: UIStackView!
    @IBOutlet weak var bank_district_stack: UIStackView!
    @IBOutlet weak var branch_account_stack: UIStackView!
    
    
    //stacks of options
    
    @IBOutlet weak var purposeStack: UIStackView!
    @IBOutlet weak var methodStack: UIStackView!
    @IBOutlet weak var bankStack: UIStackView!
    @IBOutlet weak var districtStack: UIStackView!
    @IBOutlet weak var branchStack: UIStackView!
    @IBOutlet weak var accountStack: UIStackView!
    
    @IBOutlet weak var continiueBtn: CustomButtonRounded!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BeneficiraryListController.instance.navbarimg()
        //hiding every option stacks individually
        //purposeStack.isHidden = true
        methodStack.isHidden = true
        bankStack.isHidden = true
        districtStack.isHidden = true
        branchStack.isHidden = true
        accountStack.isHidden = true
        
        //hiding continue button
        continiueBtn.isHidden = true
        
        //hiding row wise stacks which contains option stacks
        //purpose_method_stack.isHidden = true
        bank_district_stack.isHidden = true
        branch_account_stack.isHidden = true
        
        //hiding the main stack that contains everything
        //the_main_stack.isHidden = true
        
        
        menuBtn.target = revealViewController()
        menuBtn.action = #selector(SWRevealViewController.rightRevealToggle(_:))

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
       performSegue(withIdentifier: "RemittanceSum", sender: nil)
    }
    
    //----------------Custom Functiins
    
    func optionReceiver(optionName : String)
    {

        let sb = UIStoryboard(name: "BankDetailsOptionPopup", bundle: nil)
        
        let popup = sb.instantiateInitialViewController()! as! BankDetailsOptionPopupController
        popup.optionToShow = optionName
        
        self.present(popup, animated: true)
        
        popup.onDone = { (data) in
       
        
        if(optionName == "purpose")
        {
            self.choosePurposeLabel.text = data
            self.methodStack.isHidden = false
        }
        else if(optionName == "method")
        {
            self.chooseMethodLabel.text = data
            self.bank_district_stack.isHidden = false
            self.bankStack.isHidden = false
        }
        else if(optionName == "bank")
        {
            self.chooseBankLabel.text = data
            self.districtStack.isHidden = false
        }
        else if(optionName == "district")
        {
            self.chooseDistrictLabel.text = data
            self.branch_account_stack.isHidden = false
            self.branchStack.isHidden = false
        }
        else if(optionName == "branch")
        {
            self.chooseBranchLabel.text = data
            self.accountStack.isHidden = false
        }
        else if(optionName == "account")
        {
            self.chooseAccountLabel.text = data
            self.continiueBtn.isHidden = false
        }
            

        }
    }
    
}
