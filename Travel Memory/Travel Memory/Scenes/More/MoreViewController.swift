import UIKit
import SnapKit

class MoreViewController: UIViewController {
    
    private lazy var pickerView: PickerViewController = {
        let view = PickerViewController(frame: .zero)
        return view
    }()

    private let themeSegmentedControl: UISegmentedControl = {
        let items = ["Light", "Dark"]
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        return control
    }()

    private let themeLabel: MyLabel = {
        let label = MyLabel()
        label.text = "Choose Theme:".localized()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let showPickerButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        setupViews()
        setupThemeChanger()
        
//        presentPickerViewController()
    }

    private func setupViews() {
        view.addSubview(themeLabel)
        view.addSubview(themeSegmentedControl)
        view.addSubview(showPickerButton)
        view.addSubview(pickerView)
        
        themeLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalToSuperview().offset(20)
        }

        themeSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(themeLabel.snp.bottom).offset(10)
            make.leading.equalTo(themeLabel)
            make.trailing.lessThanOrEqualToSuperview().offset(-20)
        }
        
        showPickerButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(44)
        }
        
        pickerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(150)
        }
    }
    
//    private func presentPickerViewController() {
//        let pickerVC = PickerViewController()
//        pickerVC.modalPresentationStyle = .overCurrentContext
//        pickerVC.modalTransitionStyle = .crossDissolve
//        present(pickerVC, animated: true, completion: nil)
//        }

    private func setupThemeChanger() {
        themeSegmentedControl.addTarget(self, action: #selector(themeChanged), for: .valueChanged)
        updateSegmentedControlState()
    }

    @objc private func themeChanged() {
        let selectedTheme: UIUserInterfaceStyle
        switch themeSegmentedControl.selectedSegmentIndex {
        case 0:
            selectedTheme = .light
        case 1:
            selectedTheme = .dark
        default:
            selectedTheme = .unspecified
        }
        
        ThemeManager.shared.currentTheme = selectedTheme
    }


    private func updateSegmentedControlState() {
        let currentTheme = ThemeManager.shared.currentTheme
        switch currentTheme {
        case .light:
            themeSegmentedControl.selectedSegmentIndex = 0
        case .dark:
            themeSegmentedControl.selectedSegmentIndex = 1
        case .unspecified:
            themeSegmentedControl.selectedSegmentIndex = 1
        @unknown default:
            themeSegmentedControl.selectedSegmentIndex = 0
        }
    }
}

