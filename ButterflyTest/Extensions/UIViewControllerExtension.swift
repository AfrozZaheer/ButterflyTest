//
//  UIAlertViewControllerExtension.swift
//  ButterflyTest
//
//  Created by muhammad.afroz on 04/01/2024.
//

import Foundation
import UIKit

extension UIViewController {
    func showErrorAlert(msg: String?) {
        let alertController = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) {
            (action: UIAlertAction) in
        }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true)
    }
}
