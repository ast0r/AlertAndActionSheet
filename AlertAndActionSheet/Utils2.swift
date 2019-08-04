//
//  Utils2.swift
//  AlertAndActionSheet
//
//  Created by Pavel Ivanov on 4/1/19.
//  Copyright © 2019 Pavel Ivanov. All rights reserved.
//

import Foundation
import UIKit


let actionTitle = ["Up", "Down","Left","Right"]

class Utils2 {
    class func showActionSheet (from: UIViewController) {
        
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "Title1", style: .default, handler: nil)
        alert.addAction(action1)
        
        let action2 = UIAlertAction(title: "Title2", style: .default, handler: nil)
        alert.addAction(action2)
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(actionCancel)
        
        from.present(alert, animated: true, completion: nil)
    }
    
    class func showActionSheetWithCompletion(from: UIViewController, actionTitle: [String], completion: @escaping StringClosureType) {
        
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .actionSheet)
        
        for title in actionTitle {
            
            let action = UIAlertAction(title: title, style: .default) { (action) in
                completion(action.title ?? "")}
            alert.addAction(action)
        }
        
        /*let actionOk = UIAlertAction(title: "Title1", style: .default) { (action) in
            completion(action.title ?? "")}
            
           alert.addAction(actionOk)*/
        
        let  cancelAction = UIAlertAction(title: "Cansel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        from.present(alert, animated: true, completion: nil)
        }
    
    class func showAvatarMenu(from: UIViewController, completion: @escaping StringClosureType) {
        
        let alert = UIAlertController(title: nil, message: "Chooser", preferredStyle: .actionSheet)
        
        let actionCamera = UIAlertAction(title: "Camera", style: .default) { (action) in
            completion(action.title ?? "")}
        alert.addAction(actionCamera)
        
        let actionAlbom = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            completion(action.title ?? "")}
        alert.addAction(actionAlbom)
        
        let  cancelAction = UIAlertAction(title: "Cansel", style: .destructive, handler: nil)
        alert.addAction(cancelAction)
        
        from.present(alert, animated: true, completion: nil)
    }
}
