import UIKit

final class ThemeManager {
    static let shared = ThemeManager()
    
    private let themeKey = "theme"
    
    private init() {}
    
    var currentTheme: UIUserInterfaceStyle {
        get {
            let storedValue = UserDefaults.standard.integer(forKey: themeKey)
            return UIUserInterfaceStyle(rawValue: storedValue) ?? .unspecified
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: themeKey)
            applyTheme(newValue)
        }
    }

    
    func applyTheme(_ theme: UIUserInterfaceStyle?) {
        let theme = theme ?? currentTheme
        
        UIApplication.shared.windows.forEach { window in
            window.overrideUserInterfaceStyle = theme
        }
        NotificationCenter.default.post(name: .themeChanged, object: nil)
    }
}
