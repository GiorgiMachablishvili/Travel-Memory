//
//  TapGestureManager.swift
//  Travel Memory
//
//  Created by Gio's Mac on 28.09.24.
//

import UIKit

class TapGestureManager {
    static func hideKeyboardOnTap(view: UIView) {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
}
