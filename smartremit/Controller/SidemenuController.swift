//
//  SidemenuController.swift
//  Smart Remit
//
//  Created by Shajedul Islam on 16/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class SidemenuController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var menuOptions:Array = [String]()
    var menuOptionsIcon:Array = [UIImage]()
    
    var selected = ""

    override func viewDidLoad() {
        
        super.viewDidLoad()
  
        self.revealViewController().rightViewRevealWidth = self.view.frame.width/2 + 100
        
        menuOptions = ["Home","Add Recipient","Reset Password","Upload File"]
        
        menuOptionsIcon = [UIImage(named: "home_green")!,UIImage(named: "addRecipient")!,UIImage(named: "password")!,UIImage(named: "upload")!]
        
        let resetPassClick = UserDefaults.standard
        
        resetPassClick.set("granted", forKey: "RessetPasswordClick")
        

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        cell.menuOptionName.text! = menuOptions[indexPath.row]
        cell.menuOptionIcon.image = menuOptionsIcon[indexPath.row]
        
        return cell
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        if(menuOptions[indexPath.row] == "Home")
        {
            selected = "Home"
            travelScreenBySegue()
        }
        else if(menuOptions[indexPath.row] == "Reset Password")
        {
            selected = "ResetPassword"
            if((UserDefaults.standard.string(forKey: "RessetPasswordClick")) == "granted")
            {
                NotificationCenter.default.post(name: NSNotification.Name("showResetPassword"), object: nil)
            }
            
            //travelScreenBySegue()
        }
        else if(menuOptions[indexPath.row] == "Upload File")
        {
            selected = "UploadFile"
            travelScreenBySegue()
        }
        else if(menuOptions[indexPath.row] == "Add Recipient")
        {
            selected = "AddRecipient"
            travelScreenBySegue()
        }
       
        
        
    }
    
    func travelScreenBySegue()
    {
        self.revealViewController().rightViewController.performSegue(withIdentifier: selected, sender: self.revealViewController().rightViewController)
        selected = ""
        
    }
    
    @IBAction func LogoutIconAndBtnTapped(_ sender: Any) {
        
        let logout = LogoutController()
        logout.modalPresentationStyle = .custom
        
        present(logout, animated: true, completion: nil)
        
    }
    
    
}
