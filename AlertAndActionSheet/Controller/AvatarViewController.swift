//
//  AvatarViewController.swift
//  AlertAndActionSheet
//
//  Created by Pavel Ivanov on 3/29/19.
//  Copyright © 2019 Pavel Ivanov. All rights reserved.
//

import Foundation
import UIKit
import Photos

class AvatarViewController: UIViewController {

    @IBOutlet weak var imageViewAv: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func btShowActionSheet(_ sender: UIButton) {
        Utils2.showAvatarMenu(from: self) { (selected) in
            switch (selected) {
                
            case "Camera": self.presentImagePicker(withSourceType: .camera)
                
            case "Photo Library": self.presentImagePicker(withSourceType: .photoLibrary)
                
            default: break
            }
        }
    }
    
    func presentImagePicker(withSourceType type:  UIImagePickerController.SourceType){
        
        if UIImagePickerController.isSourceTypeAvailable(type){
            
            let picker = UIImagePickerController()
            picker.sourceType = type
            picker.delegate = self
            
            DispatchQueue.main.async {
                self.present(picker, animated: true, completion: nil)
            }
        }
    }
}

extension AvatarViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        picker.dismiss(animated: true, completion: nil)

        if let image = info[.originalImage] as? UIImage {
            imageViewAv.image = image
            imageViewAv.layer.cornerRadius = imageViewAv.frame.size.width/2
            imageViewAv.layer.masksToBounds = true
            imageViewAv.layer.borderWidth = 2
            imageViewAv.layer.borderColor = UIColor.green.cgColor
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {

        picker.dismiss(animated: true, completion: nil)
    }
}

