import UIKit
import SnapKit

class MyTextFieldView: UIView {
    private lazy var labelView: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.textAlignment = .left
        view.textColor = .black
        return view
    }()
    
    private lazy var textField: UITextField = {
        let view = UITextField(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.backgroundColor = .skyBlue
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var visibilityToggleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.tintColor = .gray
        button.isHidden = true
        button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        return button
    }()
    
    private var isSecured: Bool = false
    
    var text: String {
        get {
            textField.text ?? ""
        } 
        set {
            textField.text = newValue
        }
    }
    
    public var inputTextField: UITextField { 
            return textField
        }
    
    init(
        label: String,
        font: UIFont = UIFont.KoronaOneRegular(size: 15),
        isSecured: Bool = false,
        hasPasswordVisibility: Bool = false
    ) {
        super.init(frame: .zero)
        
        self.isSecured = isSecured
        
        setupHierarchy()
        setupConstraints()
        
        labelView.text = label
        labelView.font = font
        textField.isSecureTextEntry = isSecured
        visibilityToggleButton.isHidden = !hasPasswordVisibility
        
        if hasPasswordVisibility {
            setupPasswordVisibilityToggle()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        addSubview(labelView)
        addSubview(textField)
        addSubview(visibilityToggleButton)
    }
    
    func getText() -> String {
        return textField.text ?? ""
    }
    
    func clearText() {
            textField.text = ""
        }
    
    private func setupConstraints() {
        labelView.snp.remakeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(0)
            make.bottom.equalTo(self.snp.bottom)
            make.top.equalTo(self.snp.top)
            make.height.equalTo(22)
            make.width.equalTo(160)
        }
        
        visibilityToggleButton.snp.makeConstraints { make in
            make.centerY.equalTo(textField.snp.centerY)
            make.trailing.equalTo(self.snp.trailing).offset(-5)
            make.width.height.equalTo(22)
        }
        
        textField.snp.remakeConstraints { make in
            make.width.equalTo(self.snp.width).multipliedBy(0.55)
            make.leading.equalTo(labelView.snp.trailing).offset(10)
            make.bottom.equalTo(self.snp.bottom)
            make.top.equalTo(self.snp.top)
        }
        

    }
    
    private func setupPasswordVisibilityToggle() {
        textField.rightView = visibilityToggleButton
        textField.rightViewMode = .always
    }
    
    @objc private func togglePasswordVisibility() {
        isSecured.toggle()
        textField.isSecureTextEntry = isSecured
        let imageName = isSecured ? "eye.slash" : "eye"
        visibilityToggleButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}
