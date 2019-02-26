//
//  LoginController.swift
//  Smart Remit
//
//  Created by Shajedul Islam on 16/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

/*struct Login: Decodable {
    let username: String
    let password: String
}*/

//typealias CompletionHandler = (_ success : Bool) -> ()

class LoginController: UIViewController {

    @IBOutlet weak var usernameTfield: CustomTextFieldHalfRound!
    @IBOutlet weak var passwordTfield: CustomTextFieldHalfRound!
    @IBOutlet weak var menubtn: UIButton!
    @IBOutlet weak var warningStack: UIStackView!
    @IBOutlet weak var warningText: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        warningText.text = "Please insert your credentials"
        warningStack.isHidden = true
        menubtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.rightRevealToggle(_:)), for: .touchUpInside)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
      
    }
    
    @IBAction func LoginBtnAction(_ sender: UIButton)
    {
       
        let usernames = usernameTfield.text
        let passwords = passwordTfield.text
        
        
        LoginServices.instance.login(username: usernames!, password: passwords!){ (success) in
            
            if(success == true)
            {
                DispatchQueue.main.async(execute:{
                    self.succededLogin()
                    
                })
            }
            
        }
        
    }
    
    
    /*func checkLogin(username: String, password: String)
    {
        let path = Bundle.main.path(forResource: "login", ofType: "json")
        
        let url = URL(fileURLWithPath: path!)
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            do
            {
                let logindetails = try JSONDecoder().decode(Login.self, from: data!)
                
                if(logindetails.username == username && logindetails.password == password)
                {
                    DispatchQueue.main.async(execute:{
                        self.succededLogin()
                        
                    })
                }
                else if(username == "" || password == "")
                {
                    if(username == "" && password == "")
                    {
                        DispatchQueue.main.async(execute:{
                            self.showWarningUsernameNpassword()
                        })
                    }
                    else if(username == "")
                    {
                        DispatchQueue.main.async(execute:{
                            self.showWarningUsername()
                        })
                    }
                    else if (password == "")
                    {
                        DispatchQueue.main.async(execute:{
                            self.showWarningPassword()
                        })
                    }
                    
                    
                }
                    
                else{
                    DispatchQueue.main.async(execute: {
                        self.failedLogin()
                    })
                }
                
                
            }
            catch
            {
                
            }
            
        }.resume()
        
        
    }
    
    
    func succededLogin()
    {
        self.warningStack.isHidden = true
        warningText.text = "Please insert your credentials"
        
        self.revealViewController().rightViewController.performSegue(withIdentifier: "Verification", sender: self.revealViewController().rightViewController)
    }
    
    func showWarningUsername()
    {
        warningText.text = "Please insert your username"
        self.warningStack.isHidden = false
    }
    
    func showWarningPassword()
    {
        warningText.text = "Please insert your password"
        self.warningStack.isHidden = false
    }
    
    func showWarningUsernameNpassword()
    {
        warningText.text = "Please insert your credentials"
        self.warningStack.isHidden = false
    }
    
    func failedLogin()
    {
        self.warningStack.isHidden = true
        let wrongCred = WrongCredentialsXib()
        wrongCred.modalPresentationStyle = .custom
        
        present(wrongCred, animated: true, completion: nil)
    }
 */
    
    func succededLogin()
    {
        self.warningStack.isHidden = true
        warningText.text = "Please insert your credentials"
        
        self.revealViewController().rightViewController.performSegue(withIdentifier: "Verification", sender: self.revealViewController().rightViewController)
    }
    
}