//
//  LocalizationDefaultManager.swift
//  Travel Memory
//
//  Created by Gio's Mac on 02.10.24.
//

import UIKit

class LocalizationDefaultManager: NSObject {
    static let appLanguage = "app-language"
    
    static func setAppLanguage(number: Int) {
        UserDefaults.standard.setValue(number, forKey: appLanguage)
        UserDefaults.standard.synchronize()
    }
    
    static func getAppLanguage() -> Int? {
        let number = UserDefaults.standard.integer(forKey: appLanguage)
            return number
    }
    
    static func removeAppLanguage() {
        UserDefaults.standard.removeObject(forKey: appLanguage)
        UserDefaults.standard.synchronize()
    }
}
