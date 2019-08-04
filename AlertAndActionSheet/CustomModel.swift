//
//  CustomModel.swift
//  AlertAndActionSheet
//
//  Created by Pavel Ivanov on 3/29/19.
//  Copyright © 2019 Pavel Ivanov. All rights reserved.
//

import Foundation
import UIKit

class CustomModel {
    
    let completion : EmptyClosureType
    
    init(completion: @escaping EmptyClosureType) {
        self.completion = completion
    }
    
    func showAlert(from: UIViewController, completion: @escaping EmptyClosureType) {
        
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Click", style: .default) { action in
            print(action)
            self.completion()
        }
        /*alert.addAction(UIAlertAction(title: "Click", style: .default, handler: nil))*/
        alert.addAction(okAction)
        from.present(alert, animated: true, completion: nil)
    }
    
}
