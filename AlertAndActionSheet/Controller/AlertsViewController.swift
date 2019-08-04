//
//  AlertsViewController.swift
//  AlertAndActionSheet
//
//  Created by Pavel Ivanov on 3/29/19.
//  Copyright © 2019 Pavel Ivanov. All rights reserved.
//

import UIKit
import Photos

class AlertsViewController: UIViewController {

    let actionTitle = ["Ok", "Next","Left","Right"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btShowAlert(_ sender: UIButton) {
        
       /*Utils.showAlert(from: self)*/
        
       /*Utils.showAlert(from: self) {
            self.view.backgroundColor = .orange
        }*/
        
       /* Utils.showAlertCancel(from: self) {
            self.view.backgroundColor = .green
        }*/
        
        Utils.showAlertWithReturn(from: self) { (title) in
            print("return \(title)")
        }
 
    }
    
    @IBAction func btShowActionSheet(_ sender: UIButton) {
        
       // Utils2.showActionSheet(from: self)
        Utils2.showActionSheetWithCompletion(from: self, actionTitle: actionTitle ) { (title) in
            print("\(title)")
            if title == "Ok" {
               self.view.backgroundColor = .green
            }
        }
    }
    
    
    
    @IBAction func checkForAccess(_ sender: UIButton) {
        
        checkAccess()
    
    }
    
    func checkAccess() {
        
        let status = PHPhotoLibrary.authorizationStatus()
        
        switch status {
        case .authorized:
            break
        case .denied, .restricted: showAlertAndShowSetting()
        case .notDetermined:
            
            PHPhotoLibrary.requestAuthorization { [weak self] newStatus in
                if (newStatus == .authorized){
                    print("granted")
                } else {
                    print("disabled")
                    self?.showAlertAndShowSetting()
                }
            }
        default:
            break
        }
   }
    
    func showAlertAndShowSetting(){
        Utils.showAlert(from: self) {
            guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else
            { return }
            
            if(UIApplication.shared.canOpenURL(settingsURL)){
                UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
            }
        }
    }
}
