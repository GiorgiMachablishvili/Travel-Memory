import UIKit

class MyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLabel()
    }
    
    private func setupLabel() {
        updateTextColor()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(themeChanged),
                                               name: .themeChanged,
                                               object: nil)
    }
    
    @objc private func themeChanged() {
        updateTextColor()
    }
    
    private func updateTextColor() {
        switch ThemeManager.shared.currentTheme {
         case .dark:
             textColor = .white
         case .light:
             textColor = .black
         case .unspecified:
             textColor = .gray
         @unknown default:
             textColor = .black
         }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension Notification.Name {
    static let themeChanged = Notification.Name("ThemeChangedNotification")
}
