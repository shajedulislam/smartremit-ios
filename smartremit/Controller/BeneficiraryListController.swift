//
//  BeneficiraryListController.swift
//  smartremit
//
//  Created by Shajedul Islam on 17/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class BeneficiraryListController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var menuBtn: UIButton!
    let benList = getBenList()
   
    @IBOutlet var label_total_ben: UILabel!
    @IBOutlet var label_total_gbp: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        showBenLabel()
        
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.rightRevealToggle(_:)), for: .touchUpInside)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
    }
    
    func showBenLabel(){
        
        label_total_ben.text = "Benificiary: " + String(benList.count)
        var sum = 0.0
        for n in 0...benList.count-1{
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
     
        //  cell.sent.text = "Sent (GBP): " + String(benList[indexPath.row].getSent())
      //  cell.sent.textColor = UIColor.white
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        
        self.revealViewController().rightViewController.performSegue(withIdentifier: "BankDetails", sender: self.revealViewController().rightViewController)
    }
    

    @IBAction func back_button(_ sender: Any) {
        self.revealViewController().rightViewController.performSegue(withIdentifier: "Verification", sender: self.revealViewController().rightViewController)
    } 
}
