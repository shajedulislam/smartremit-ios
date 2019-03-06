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
        
        //-----(Modifying The Sidebar Frame)-----
        self.revealViewController().rightViewRevealWidth = self.view.frame.width/2 + 100 // Frame Lenhgth
        //----------End
        
        //-----(Initial Sidebar Options)-----Start
        menuOptions = ["Home"]
        menuOptionsIcon = [UIImage(named: "home_green")!]
        //----------End
        
        //-----(Access Granted To Click On Sidebar Options)-----Start
        //UserDefaults.standard.set("granted", forKey: "AddRecipientClick")
        //UserDefaults.standard.set("granted", forKey: "RessetPasswordClick")
        //UserDefaults.standard.set("granted", forKey: "UploadFileClick")
        //----------End
        
        //-----(Sidebar Options Enabled)-----Start
        NotificationCenter.default.addObserver(self, selector: #selector(enableSideBarOptions), name: NSNotification.Name("enableSideBarOptions"), object: nil)//Enabled using NotificationCenter If Sidebar Tapped Before Login
        
        if ((UserDefaults.standard.string(forKey: "verDone")) == "verDone")//Enabled Using Keyvalue Trick If Sidebar Tapped After Logion
        {
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
            NotificationCenter.default.post(name: NSNotification.Name("popToRootViewController"), object: nil)
            NotificationCenter.default.post(name: NSNotification.Name("showResetPassword"), object: nil)
            self.revealViewController()?.rightRevealToggle(self)
        }
            
        else if(menuOptions[indexPath.row] == "Upload File")
        {
            NotificationCenter.default.post(name: NSNotification.Name("popToRootViewController"), object: nil)
            NotificationCenter.default.post(name: NSNotification.Name("showUploadFile"), object: nil)
            self.revealViewController()?.rightRevealToggle(self)
        }
            
        else if(menuOptions[indexPath.row] == "Add Recipient")
        {
            NotificationCenter.default.post(name: NSNotification.Name("popToRootViewController"), object: nil)
            NotificationCenter.default.post(name: NSNotification.Name("showAddRecipient"), object: nil)
            self.revealViewController()?.rightRevealToggle(self)
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
