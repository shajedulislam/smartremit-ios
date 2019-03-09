//
//  UploadFileController.swift
//  smartremit
//
//  Created by Shajedul Islam on 18/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import UIKit

class UploadFileController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var imageView: CustomeImageViewDesign!
    @IBOutlet weak var selectBtnForFileUp: CustomButtonRounded!
    
    var selectionImg = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        menuBtn.target = revealViewController()
        menuBtn.action = #selector(SWRevealViewController.rightRevealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())

        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(ResetPasswordController.back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton

        //imageView.isHidden = true
    }
    
    @objc func back(sender: UIBarButtonItem) {
        
        UserDefaults.standard.set("granted", forKey: "UploadFileClick")
        _ = navigationController?.popViewController(animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        //imageView.isHidden = false
        selectBtnForFileUp.setTitle("Upload", for: .normal)
        selectionImg = true
        
        imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
  
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
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
        
        imageView.image = #imageLiteral(resourceName: "no_image_available")
        selectBtnForFileUp.setTitle("Select", for: .normal)
        selectionImg = false
        
    }
    
    @IBAction func backBtnToBenList(_ sender: Any) {
        
        self.revealViewController().rightViewController.performSegue(withIdentifier: "BeneficiaryList", sender: self.revealViewController().rightViewController)
    }
    
    func selectImage()
    {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }

    func uploadImage()
    {
        imageView.image = #imageLiteral(resourceName: "no_image_available")
        selectBtnForFileUp.setTitle("Select", for: .normal)
    }
}
