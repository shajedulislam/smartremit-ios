//
//  TransactionStatusController.swift
//  smartremit
//
//  Created by Shajedul Islam on 7/3/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class TransactionStatusController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    
    var referenceNo = ["SB62090","SB33038"]
    var beneficiaryName = ["Shajedul","Robin"]
    var amount = ["10000","12000"]
    var status = ["Transferred","Failed"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        menuBtn.target = revealViewController()
        menuBtn.action = #selector(SWRevealViewController.rightRevealToggle(_:))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return referenceNo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableCell") as! TransactionTableCell
        
        cell.referenceNoLabel.text = "Reference No: \(referenceNo[indexPath.row])"
        cell.beneficiaryLabel.text = "Beneficiary: \(beneficiaryName[indexPath.row])"
        cell.amountLabel.text = "Amount (BDT): \(amount[indexPath.row])"
        cell.statusLabel.text = "Status: \(status[indexPath.row])"
        
        if(status[indexPath.row] == "Transferred")
        {
            cell.statusColorBar.layer.backgroundColor = #colorLiteral(red: 0.4705882353, green: 0.9019607843, blue: 0.1568627451, alpha: 1)
            cell.statusColorBar.layer.shadowColor = #colorLiteral(red: 0.4705882353, green: 0.9019607843, blue: 0.1568627451, alpha: 1)
            cell.statusColorBar.barStyle()
        }
        else if(status[indexPath.row] == "Failed")
        {
            cell.statusColorBar.layer.backgroundColor = #colorLiteral(red: 0.7843137255, green: 0.03921568627, blue: 0.3333333333, alpha: 1)
            cell.statusColorBar.layer.shadowColor = #colorLiteral(red: 0.7843137255, green: 0.03921568627, blue: 0.3333333333, alpha: 1)
            cell.statusColorBar.barStyle()
        }
        
        return cell
    }
}

extension UIView {
    func barStyle(){
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 6
        layer.cornerRadius = 3
    }
}
