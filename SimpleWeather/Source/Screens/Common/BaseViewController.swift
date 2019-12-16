//
//  BaseViewController.swift
//  SimpleWeather
//
//  Created by Jakub Kurgan on 16/12/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Alerts
    
    func showAlert(title: String, message: String, approveButtonText: String, completion: (() -> ())?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: approveButtonText, style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: completion)
    }
}
