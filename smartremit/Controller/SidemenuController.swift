//
//  SidemenuController.swift
//  Smart Remit
//
//  Created by Shajedul Islam on 16/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class SidemenuController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    static var instance = SidemenuController()
    
    var menuOptions:Array = [String]()
    var menuOptionsIcon:Array = [UIImage]()
    
    var selected = ""
    
    var optionChange = 0
    
    @IBOutlet weak var sideBarTable: UITableView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("MenuLoad")
        //-----(Modifying The Sidebar Frame)-----
        self.revealViewController().rightViewRevealWidth = self.view.frame.width/2 + 100 // Frame Lenhgth
        //----------End
        
        //-----(Initial Sidebar Options)-----Start
        menuOptions = ["Home"]
        menuOptionsIcon = [UIImage(named: "home_green")!]
        //----------End
        
        //-----(Access Granted To Click On Sidebar Options)-----Start
        UserDefaults.standard.set("granted", forKey: "AddRecipientClick")
        UserDefaults.standard.set("granted", forKey: "RessetPasswordClick")
        //----------End
        
        //-----(Sidebar Options Enabled)-----Start
        NotificationCenter.default.addObserver(self, selector: #selector(enableSideBarOptions), name: NSNotification.Name("enableSideBarOptions"), object: nil)//Enabled using NotificationCenter If Sidebar Tapped Before Login
        
        if ((UserDefaults.standard.string(forKey: "verDone")) == "verDone")//Enabled Using Keyvalue Trick If Sidebar Tapped After Logion
        {
            print("invoked in varDone")
            
            menuOptions = ["Home","Add Recipient","Reset Password","Upload File"]
            
            menuOptionsIcon = [UIImage(named: "home_green")!,UIImage(named: "addRecipient")!,UIImage(named: "password")!,UIImage(named: "upload")!]
            
            sideBarTable.reloadData()
            
            UserDefaults.standard.set("verNotDone", forKey: "verDone")
        }
        //----------End
        
        
        

    }
    
    //-----(NotificationCenter Will Call This For Sidebar)-----Start
    @objc func enableSideBarOptions()
    {
        print("invoked")
        
        menuOptions = ["Home","Add Recipient","Reset Password","Upload File"]
        
        menuOptionsIcon = [UIImage(named: "home_green")!,UIImage(named: "addRecipient")!,UIImage(named: "password")!,UIImage(named: "upload")!]
        
        sideBarTable.reloadData()
        UserDefaults.standard.set("verNotDone", forKey: "verDone")
    }
    //----------End
    
    
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
            if((UserDefaults.standard.string(forKey: "RessetPasswordClick")) == "granted")
            {
                NotificationCenter.default.post(name: NSNotification.Name("popViewController"), object: nil)
                NotificationCenter.default.post(name: NSNotification.Name("showResetPassword"), object: nil)
                //UserDefaults.standard.set("grantOff", forKey: "RessetPasswordClick")
                self.revealViewController()?.rightRevealToggle(self)
            }
//            else
//            {
//                UserDefaults.standard.set("granted", forKey: "RessetPasswordClick")
//                self.revealViewController()?.rightRevealToggle(self)
//            }
            //selected = "ResetPassword"
            //travelScreenBySegue()
        }
        else if(menuOptions[indexPath.row] == "Upload File")
        {
            selected = "UploadFile"
            travelScreenBySegue()
        }
        else if(menuOptions[indexPath.row] == "Add Recipient")
        {
            if((UserDefaults.standard.string(forKey: "AddRecipientClick")) == "granted")
            {
                NotificationCenter.default.post(name: NSNotification.Name("popViewController"), object: nil)
                NotificationCenter.default.post(name: NSNotification.Name("showAddRecipient"), object: nil)
                //UserDefaults.standard.set("grantOff", forKey: "AddRecipientClick")
                self.revealViewController()?.rightRevealToggle(self)
            }
//            else
//            {
//                UserDefaults.standard.set("granted", forKey: "AddRecipientClick")
//
//                self.revealViewController()?.rightRevealToggle(self)
//            }
//            selected = "AddRecipient"
//            travelScreenBySegue()
        }
       
        
        
    }
    
    func travelScreenBySegue()
    {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("enableSideBarOptions"), object: nil)
        
        
        self.revealViewController().rightViewController.performSegue(withIdentifier: selected, sender: self.revealViewController().rightViewController)
        selected = ""
        
    }
    
    @IBAction func LogoutIconAndBtnTapped(_ sender: Any) {
        
        let logout = LogoutController()
        logout.modalPresentationStyle = .custom
        
        present(logout, animated: true, completion: nil)
        
    }
    
    
    
}
