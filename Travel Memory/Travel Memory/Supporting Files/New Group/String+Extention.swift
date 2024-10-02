//
//  String+Extention.swift
//  Travel Memory
//
//  Created by Gio's Mac on 02.10.24.
//

import UIKit

extension String {
    func localized() -> String {
        if let appLanguage = LocalizationDefaultManager.getAppLanguage() {
            if appLanguage == 1 {
                guard let path = Bundle.main.path(forResource: "ka", ofType: "lproj"),let bundle = Bundle(path: path) else {
                    return ""
                }
                return NSLocalizedString(self,tableName: "Localizable", bundle: bundle, value: self, comment: self)
            }
        }
        guard let path = Bundle.main.path(forResource: "en", ofType: "lproj"),let bundle = Bundle(path: path) else {
            return ""
        }
        return NSLocalizedString(self,tableName: "Localizable", bundle: bundle, value: self, comment: self)
    }
}

