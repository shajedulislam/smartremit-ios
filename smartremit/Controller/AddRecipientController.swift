//
//  AddRecipientController.swift
//  smartremit
//
//  Created by Shajedul Islam on 19/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class AddRecipientController: UIViewController {

    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var OptionsContainerStack: UIStackView!
    @IBOutlet weak var accountNoTextField: CustomTextFieldHalfRoundedClear!
    @IBOutlet weak var continueBtnAddRec: CustomButtonRounded!
    @IBOutlet weak var cashPickupBtn: CustomButtonRounded!
    @IBOutlet weak var toBankAccountBtn: CustomButtonRounded!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.rightRevealToggle(_:)), for: .touchUpInside)
        
        OptionsContainerStack.isHidden = true
        accountNoTextField.isHidden = true
        continueBtnAddRec.isHidden = true

        // Do any additional setup after loading the view.
    }
 
    @IBAction func backBtnToBenList(_ sender: UIButton) {
        
        self.revealViewController().rightViewController.performSegue(withIdentifier: "BeneficiaryList", sender: self.revealViewController().rightViewController)
        
        
    }
    @IBAction func cashPickupTapped(_ sender: Any) {
        
        OptionsContainerStack.isHidden = false
        accountNoTextField.isHidden = true
        continueBtnAddRec.isHidden = false
        
       
        
       // continueBtnAddRec.topAnchor.constraint(equalTo: OptionsContainerStack.bottomAnchor, constant: 32).isActive = true
        
        cashPickupBtn.borderColorForBtn()
        toBankAccountBtn.noBorderForBtn()
        
        
        
    }
    @IBAction func toBankAccountTapped(_ sender: Any) {
        OptionsContainerStack.isHidden = false
        accountNoTextField.isHidden = false
        continueBtnAddRec.isHidden = false
        
        toBankAccountBtn.borderColorForBtn()
        cashPickupBtn.noBorderForBtn()

    }
    
}

extension UIButton{
    func borderColorForBtn(){
        
        self.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.layer.borderWidth = 2
        
    }
    func noBorderForBtn(){
        self.layer.borderColor = nil
        self.layer.borderWidth = 0
    }
}
