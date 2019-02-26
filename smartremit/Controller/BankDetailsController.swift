//
//  BankDetailsController.swift
//  smartremit
//
//  Created by Shajedul Islam on 18/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class BankDetailsController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate{
    @IBOutlet weak var choosePurposeLabel: UILabel!
    @IBOutlet weak var choosePurposeBtn: UIButton!
    
    @IBOutlet weak var optionPicker: UIPickerView!
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var choosePurposeTfield: UITextField!
    
    var choosePurpose = ["Family Support", "Abc", "Dfg"]
    
    var optionStore = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //createPickerView()
        //dissmissPickerVIew()
        
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.rightRevealToggle(_:)), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return choosePurpose.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return choosePurpose[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        optionStore = choosePurpose[row]
        
       
        
        choosePurposeLabel.text = optionStore
        
        
    }
    
    /*func createPickerView()
    {
        let pickerview = UIPickerView()
        pickerview.delegate = self
        choosePurposeTfield.inputView = pickerview
    }
    
    func dissmissPickerVIew()
    {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dissmissKeyboard))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        choosePurposeTfield.inputAccessoryView = toolbar
       
     
    }
    @objc func dissmissKeyboard()
    {
        view.endEditing(true)
    }*/
    
    
    
    @IBAction func BackBtnToBenList(_ sender: Any) {
        
        self.revealViewController().rightViewController.performSegue(withIdentifier: "BeneficiaryList", sender: self.revealViewController().rightViewController)
    }
    
    
    
    @IBAction func choosePurposeTapped(_ sender: Any) {
        
        
    }
}
