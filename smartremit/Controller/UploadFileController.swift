//
//  UploadFileController.swift
//  smartremit
//
//  Created by Shajedul Islam on 18/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class UploadFileController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: CustomeImageViewDesign!
    
    @IBOutlet weak var selectBtnForFileUp: CustomButtonRounded!
    
    var selectionImg = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        imageView.isHidden = true
    }
   
    
    
    
    //////All Atribute Functions/////////
  
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        imageView.isHidden = false
        selectBtnForFileUp.setTitle("Upload", for: .normal)
        selectionImg = true
        
        imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    
    }
    
  
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    ///////All Button Actions//////
    
    @IBAction func selectBtntappedForUpload(_ sender: Any) {
        
        if(selectionImg == false)
        {
            selectImage()
        }
        else if(selectionImg == true)
        {
            uploadImage()
            selectionImg = false
        }
    }
    
    @IBAction func fileUploadCancelBtnTapped(_ sender: Any) {
        
        imageView.image = nil
        imageView.isHidden = true
        selectBtnForFileUp.setTitle("Select", for: .normal)
        selectionImg = false
        
    }
    
    @IBAction func backBtnToBenList(_ sender: Any) {
        
        self.revealViewController().rightViewController.performSegue(withIdentifier: "BeneficiaryList", sender: self.revealViewController().rightViewController)
    }
    
    //////Custom Functions//////
    
    func selectImage()
    {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    //Data Service Point
    func uploadImage()
    {
        imageView.image = nil
        imageView.isHidden = true
        selectBtnForFileUp.setTitle("Select", for: .normal)
    }
}
