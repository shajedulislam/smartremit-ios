//
//  BankDetailsOptionPopupController.swift
//  smartremit
//
//  Created by Shajedul Islam on 28/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class BankDetailsOptionPopupController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var popupHeaderText: UILabel!
    var optionToShow : String = ""
    
    var optionList = [""]
    
    var choosenOption : String = ""
    
    var onDone: ((_ data: String) -> ())?
    
    //let methodList = ["To Bank Account","Cash Pick-up (PIN)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        if(optionToShow == "purpose")
        {
            popupHeaderText.text = "Choose Purpose"
            optionList = ["Family Support","Another value","Another value"]
            choosenOption = optionList[0]
        }
        else if(optionToShow == "method")
        {
            popupHeaderText.text = "Choose Payment Method"
            optionList = ["To Bank Account","Cash Pick-up (PIN)"]
            choosenOption = optionList[0]
        }
        else if(optionToShow == "bank")
        {
            popupHeaderText.text = "Choose Bank"
            optionList = ["Southeast Bank Ltd.", "City Bank", "Brac Bank"]
            choosenOption = optionList[0]
        }
        else if(optionToShow == "district")
        {
            popupHeaderText.text = "Choose District"
            optionList = ["Dhaka","Chandpur","Comilla"]
            choosenOption = optionList[0]
        }
        else if(optionToShow == "branch")
        {
            popupHeaderText.text = "Choose Branch"
            optionList = ["Dhaka Banani Branch","Dhaka Gulshan Branch","Chandpur Branch"]
            choosenOption = optionList[0]
        }
        else if(optionToShow == "account")
        {
            popupHeaderText.text = "Choose Account"
            optionList = ["12345","54321"]
            choosenOption = optionList[0]
        }
    }
    
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return optionList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return optionList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        choosenOption = optionList[row]
        
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let myTitle = NSAttributedString(string: optionList[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        return myTitle
    }
    
    
    @IBAction func closeOptionMenu(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    

  
    @IBAction func doneSelectingOption(_ sender: Any) {
        
        onDone?(choosenOption)
        dismiss(animated: true, completion: nil)
    }
    
}
