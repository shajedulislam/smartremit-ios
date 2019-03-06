//
//  LoginController.swift
//  Smart Remit
//
//  Created by Shajedul Islam on 16/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var usernameTfield: CustomTextFieldHalfRound!
    @IBOutlet weak var passwordTfield: CustomTextFieldHalfRound!
    @IBOutlet weak var menubtn: UIButton!
    @IBOutlet weak var warningStack: UIStackView!
    @IBOutlet weak var warningText: UILabel!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        warningText.text = "Please insert your credentials"
        warningStack.isHidden = true

        menuBtn.target = revealViewController()
        menuBtn.action = #selector(SWRevealViewController.rightRevealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }
    
    
    @IBAction func LoginBtnAction(_ sender: UIButton)
    {
        let usernames = usernameTfield.text
        let passwords = passwordTfield.text
        
        if(usernames == "" && passwords == "")
        {
            loginAlerts(title: "Error !", message: "Insert Username & Password")
        }
        else if(usernames == "")
        {
            loginAlerts(title: "Error !", message: "Insert Username")
        }
        else if(passwords == "")
        {
            loginAlerts(title: "Error !", message: "Insert Password")
        }
        
        else
        {
            LoginServices.instance.login(username: usernames!, password: passwords!) { (success) in
                
                if(success == true)
                {
                    DispatchQueue.main.async(execute:{ self.succededLogin() })
                }
                else if(success == false)
                {
                    DispatchQueue.main.async(execute:{ self.failedLogin() })
                }
            }
        }
    }
    
    func succededLogin()
    {
        self.warningStack.isHidden = true
        warningText.text = "Please insert your credentials"

        self.revealViewController().rightViewController.performSegue(withIdentifier: "Verification", sender: self.revealViewController().rightViewController)
    }
    
    func loginAlerts(title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (ACTION) in alert.dismiss(animated: true, completion: nil)}))
        
        self.present(alert, animated: true, completion: nil)
     
    }
    
    func failedLogin()
    {
        self.warningStack.isHidden = true
        let wrongCred = WrongCredentialsXib()
        wrongCred.modalPresentationStyle = .custom
        
        present(wrongCred, animated: true, completion: nil)
    }
    
}
