//
//  Utils.swift
//  AlertAndActionSheet
//
//  Created by Pavel Ivanov on 3/28/19.
//  Copyright © 2019 Pavel Ivanov. All rights reserved.
//

import Foundation
import UIKit

typealias EmptyClosureType = (() -> ())
typealias StringClosureType = ((String) -> ())
let AlertsTitle = ["Up", "Down","Left","Right"]

class Utils {
    
    class func showAlert (from: UIViewController) {
        
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
        for title in AlertsTitle {
            alert.addAction(UIAlertAction(title: title, style: .default, handler: nil))
        }
            
        from.present(alert, animated: true, completion: nil)
    }
    
    class func showAlert(from: UIViewController, completion: @escaping EmptyClosureType) {
        
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Click", style: .default) { action in
            completion()
        }
        
        /*alert.addAction(UIAlertAction(title: "Click", style: .default, handler: nil))*/
        alert.addAction(okAction)
        from.present(alert, animated: true, completion: nil)
    }
    
    class func showAlertCancel(from: UIViewController, completion: @escaping EmptyClosureType) {
        
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(cancelAction)
        
        let okAction = UIAlertAction(title: "Click", style: .default) { action in
            completion()
        }
        alert.addAction(okAction)
        
        from.present(alert, animated: true, completion: nil)
    }
    
    class func showAlertWithReturn(from: UIViewController, completion: @escaping StringClosureType) {
        
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
        
        for title in AlertsTitle {
            
            let action = UIAlertAction(title: title, style: .default) { action in
                completion(action.title ?? "")
            }
            
            alert.addAction(action)
        }
        
        /*let okAction = UIAlertAction(title: "Click", style: .default) { action in
            completion(action.title ?? "")
        }
        
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(cancelAction)*/
        
        from.present(alert, animated: true, completion: nil)
        
    }
}
