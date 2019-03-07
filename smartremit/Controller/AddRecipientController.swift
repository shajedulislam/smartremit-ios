//
//  AddRecipientController.swift
//  smartremit
//
//  Created by Shajedul Islam on 19/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class AddRecipientController: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var OptionsContainerStack: UIStackView!
    @IBOutlet weak var accountNoTextField: CustomTextFieldHalfRoundedClear!
    @IBOutlet weak var continueBtnAddRec: CustomButtonRounded!
    @IBOutlet weak var cashPickupBtn: CustomButtonRounded!
    @IBOutlet weak var toBankAccountBtn: CustomButtonRounded!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        OptionsContainerStack.isHidden = true
        accountNoTextField.isHidden = true
        continueBtnAddRec.isHidden = true
        
        menuBtn.target = revealViewController()
        menuBtn.action = #selector(SWRevealViewController.rightRevealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())

        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(ResetPasswordController.back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
    }
    
    @objc func back(sender: UIBarButtonItem)
    {
        UserDefaults.standard.set("granted", forKey: "AddRecipientClick")
        _ = navigationController?.popViewController(animated: true)
    }
 
    @IBAction func cashPickupTapped(_ sender: Any)
    {
        OptionsContainerStack.isHidden = false
        accountNoTextField.isHidden = true
        continueBtnAddRec.isHidden = false

        cashPickupBtn.borderColorForBtn()
        toBankAccountBtn.noBorderForBtn()
    }
    @IBAction func toBankAccountTapped(_ sender: Any)
    {
        OptionsContainerStack.isHidden = false
        accountNoTextField.isHidden = false
        continueBtnAddRec.isHidden = false
        
        toBankAccountBtn.borderColorForBtn()
        cashPickupBtn.noBorderForBtn()
    }

//    func scrollViewDidScroll(_ scrollView: UIScrollView)
//    {
//        if (scrollView.contentOffset.y <= -50)
//        {
//            //print("At Top")
//        }
//    }
}

    extension UIButton
    {
        func borderColorForBtn()
        {
            self.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.layer.borderWidth = 2
        }
        func noBorderForBtn()
        {
            self.layer.borderColor = nil
            self.layer.borderWidth = 0
        }
    }
