//
//  SceneManager.swift
//  Travel Memory
//
//  Created by Irakli Kochua on 18.09.24.
//

import Foundation
import UIKit



final class ThemeManager {
    static let shared = ThemeManager()
    
    private let themeKey = "theme"
    
    private init() {}
    
    func getTheme() -> UIUserInterfaceStyle {
        let storageThemeRawValue = UserDefaults.standard.integer(forKey: themeKey)
        
        return UIUserInterfaceStyle(rawValue: storageThemeRawValue) ??   UITraitCollection.current.userInterfaceStyle
    }
    
    func saveTheme(_ theme: UIUserInterfaceStyle) {
        UserDefaults.standard.set(theme.rawValue, forKey: themeKey)
        applyTheme(theme)
    }
    
    func applyTheme(_ theme: UIUserInterfaceStyle? = nil) {
        let theme = theme ?? getTheme()
        
        UIApplication.shared.windows.forEach { window in
              window.overrideUserInterfaceStyle = theme
          }
    }
}


