//
//  BeneficiraryListController.swift
//  smartremit
//
//  Created by Shajedul Islam on 17/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class BeneficiraryListController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    static var instance = BeneficiraryListController()
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    let benList = getBenList()
   
    @IBOutlet var label_total_ben: UILabel!
    @IBOutlet var label_total_gbp: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        NotificationCenter.default.addObserver(self, selector: #selector(showResetPassword), name: NSNotification.Name("showResetPassword"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showAddRecipient), name: NSNotification.Name("showAddRecipient"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showUploadFile), name: NSNotification.Name("showUploadFile"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(popToRootViewController), name: NSNotification.Name("popToRootViewController"), object: nil)
    
        showBenLabel()
        menuBtn.target = revealViewController()
        menuBtn.action = #selector(SWRevealViewController.rightRevealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
    }
    
    func showBenLabel(){
        
        label_total_ben.text = "Benificiary: " + String(benList.count)
        var sum = 0.0
        for n in 0...benList.count-1
        {
            sum = sum + benList[n].getSent()
        }
       label_total_gbp.text = "Total (GBP): " + String(sum)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return benList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.label_name.text = benList[indexPath.row].getName()
        cell.label_name.textColor = UIColor.white
        cell.label_trnsHistory.text = "Trans: " + String(benList[indexPath.row].getNoOfTrns()) + ", Sent (GBP): " + String(benList[indexPath.row].getSent())
        cell.label_trnsHistory.textColor = UIColor.white
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
       performSegue(withIdentifier: "BankDetails", sender: nil)
    }

    @objc func showResetPassword()
    {
        performSegue(withIdentifier: "ResetPassword", sender: nil)
    }
    
    @objc func showAddRecipient()
    {
        performSegue(withIdentifier: "AddRecipient", sender: nil)
    }
    
    @objc func showUploadFile()
    {
        performSegue(withIdentifier: "UploadFile", sender: nil)
    }
    
    @objc func popToRootViewController()
    {
        navigationController?.popToRootViewController(animated: false)
        //navigationController?.pushViewController(AddRecipientController(), animated: true)
        
//        for vc in (self.navigationController?.viewControllers)!
//
//        {
//            if vc is AddRecipientController
//            {
//                _ = self.navigationController?.popToViewController(vc, animated: true)
//            }
//        }
        
    }
    
//    func navbarimg(){
//        
//         self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "banner")?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), resizingMode : .stretch ), for: .default)
//        
//        
//    }

}
