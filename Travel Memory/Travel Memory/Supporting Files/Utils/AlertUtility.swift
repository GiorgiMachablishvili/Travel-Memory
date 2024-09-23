//
//  AlertUtility.swift
//  Travel Memory
//
//  Created by Irakli Kochua on 23.09.24.
//

import Foundation
import UIKit

enum AlertUtility {
    struct AlertAction {
        let title: String
        let style: UIAlertAction.Style
        let handler: (() -> Void)?
    }
    
    static func showAlert(
        on viewController: UIViewController,
        title: String,
        message: String,
        style: UIAlertController.Style = .alert,
        actions: [AlertAction]
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        for action in actions {
            let alertAction = UIAlertAction(title: action.title, style: action.style) { _ in
                action.handler?()
            }
            alert.addAction(alertAction)
        }
        
        viewController.present(alert, animated: true)
    }
    
    static func showSimpleAlert(
        on viewController: UIViewController,
        title: String,
        message: String,
        buttonTitle: String = "OK",
        completion: (() -> Void)? = nil
    ) {
        showAlert(
            on: viewController,
            title: title,
            message: message,
            actions: [AlertAction(title: buttonTitle, style: .default, handler: completion)]
        )
    }
}
