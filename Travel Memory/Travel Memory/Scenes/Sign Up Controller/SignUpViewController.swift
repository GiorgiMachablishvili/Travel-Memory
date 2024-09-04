//
//  SignUpViewController.swift
//  Travel Memory
//
//  Created by Gio's Mac on 03.09.24.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    
    //MARK: -UI components
    private lazy var topColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.init(hexString: "0371F2").withAlphaComponent(25)
        return view
    }()
    
    private lazy var logoImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "FLIGHT")
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 20)
        view.textColor = UIColor.init(hexString: "000000")
        view.textAlignment = .center
        view.text = "TRAVEL MEMORY"
        return view
    }()
    
    private lazy var sloganLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.textColor = UIColor.init(hexString: "000000")
        view.textAlignment = .center
        view.text = "JOURNAL"
        return view
    }()
    
    private lazy var signupLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 24)
        view.textColor = UIColor.init(hexString: "000000")
        view.textAlignment = .center
        view.text = "Sign Up"
        return view
    }()
    
    private lazy var infoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 14)
        view.textColor = UIColor.init(hexString: "000000")
        view.textAlignment = .left
        view.numberOfLines = 2
        view.text = "Please fill in the following information to create your account:"
        return view
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.textColor = UIColor.init(hexString: "000000")
        view.textAlignment = .left
        view.text = "Full name:"
        return view
    }()
    
    private lazy var fullNameTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.backgroundColor = UIColor.init(hexString: "CDE3FC")
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var fullNameAlarmLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 9)
        view.textColor = UIColor.init(hexString: "F80D0D")
        view.textAlignment = .left
        view.isHidden = true
        return view
    }()
    
    private lazy var emailLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.textColor = UIColor.init(hexString: "000000")
        view.textAlignment = .left
        view.text = "Email:"
        return view
    }()
    
    private lazy var emailTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.backgroundColor = UIColor.init(hexString: "CDE3FC")
        view.layer.cornerRadius = 8
        view.keyboardType = .emailAddress
        return view
    }()
    
    private lazy var emailAlarmLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 9)
        view.textColor = UIColor.init(hexString: "F80D0D")
        view.textAlignment = .left
        view.isHidden = true
        return view
    }()
    
    private lazy var passwordLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.textColor = UIColor.init(hexString: "000000")
        view.textAlignment = .left
        view.text = "Password:"
        return view
    }()
    
    private lazy var passwordTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.backgroundColor = UIColor.init(hexString: "CDE3FC")
        view.layer.cornerRadius = 8
        view.isSecureTextEntry = true
        return view
    }()
    
    private lazy var passwordAlarmLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 9)
        view.textColor = UIColor.init(hexString: "F80D0D")
        view.textAlignment = .left
        view.isHidden = true
        return view
    }()
    
    private lazy var confirmPswLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textColor = UIColor.init(hexString: "000000")
        view.textAlignment = .left
        view.text = "Confirm Psw:"
        return view
    }()
    
    private lazy var confirmPswTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.backgroundColor = UIColor.init(hexString: "CDE3FC")
        view.layer.cornerRadius = 8
        view.isSecureTextEntry = true
        return view
    }()
    
    private lazy var confirmPswAlarmLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 9)
        view.textColor = UIColor.init(hexString: "F80D0D")
        view.textAlignment = .left
        view.isHidden = true
        return view
    }()
    
    private lazy var bottomColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.init(hexString: "0371F2")
        return view
    }()
    
    private lazy var createAccountButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Create Account", for: .normal)
        view.setTitleColor(UIColor.init(hexString: "000000"), for: .normal)
        view.backgroundColor = UIColor.init(hexString: "CDE3FC").withAlphaComponent(25)
        view.layer.cornerRadius = 8
        view.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var questionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textColor = UIColor.init(hexString: "000000")
        view.textAlignment = .left
        view.text = "Already have an account?"
        return view
    }()
    
    private lazy var signInButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Sign In", for: .normal)
        view.setTitleColor(UIColor.init(hexString: "000000"), for: .normal)
        view.titleLabel?.font = UIFont.KoronaOneRegular(size: 12)
        view.clipsToBounds = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        view.backgroundColor = .systemBackground
        
    }
    
    private func setup() {
        view.addSubview(topColorView)
        topColorView.addSubview(logoImage)
        topColorView.addSubview(nameLabel)
        topColorView.addSubview(sloganLabel)
        topColorView.addSubview(signupLabel)
        view.addSubview(infoLabel)
        view.addSubview(fullNameLabel)
        view.addSubview(fullNameTextField)
        view.addSubview(fullNameAlarmLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(emailAlarmLabel)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordAlarmLabel)
        view.addSubview(confirmPswLabel)
        view.addSubview(confirmPswTextField)
        view.addSubview(confirmPswAlarmLabel)
        view.addSubview(bottomColorView)
        bottomColorView.addSubview(createAccountButton)
        bottomColorView.addSubview(questionLabel)
        bottomColorView.addSubview(signInButton)
    }
    
    private func layout() {
        topColorView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(292 * Constraint.yCoeff)
        }
        
        logoImage.snp.remakeConstraints { make in
            make.top.equalTo(topColorView.snp.top).offset(101)
            make.centerX.equalTo(topColorView.snp.centerX)
            make.height.width.equalTo(65)
        }
        
        nameLabel.snp.remakeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(0)
            make.centerX.equalTo(topColorView.snp.centerX)
            make.height.equalTo(25)
        }
        
        sloganLabel.snp.remakeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.centerX.equalTo(topColorView.snp.centerX)
            make.height.equalTo(29)
            make.width.equalTo(133)
        }
        
        signupLabel.snp.remakeConstraints { make in
            make.top.equalTo(sloganLabel.snp.bottom).offset(18)
            make.centerX.equalTo(topColorView.snp.centerX)
            make.height.equalTo(30)
            make.width.equalTo(123)
        }
        
        infoLabel.snp.remakeConstraints { make in
            make.top.equalTo(topColorView.snp.bottom).offset(9)
            make.centerX.equalTo(topColorView.snp.centerX)
            make.width.equalTo(353)
        }
        
        fullNameLabel.snp.remakeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(30)
            make.leading.equalTo(view.snp.leading).offset(37)
            make.height.equalTo(19)
            make.width.equalTo(105)
        }
        
        fullNameTextField.snp.remakeConstraints { make in
            make.leading.equalTo(fullNameLabel.snp.trailing).offset(35)
            make.centerY.equalTo(fullNameLabel.snp.centerY)
            make.height.equalTo(19)
            make.width.equalTo(191)
        }
        
        fullNameAlarmLabel.snp.remakeConstraints { make in
            make.top.equalTo(fullNameLabel.snp.bottom).offset(5)
            make.leading.equalTo(view.snp.leading).offset(37)
            make.height.equalTo(11)
        }
        
        emailLabel.snp.remakeConstraints { make in
            make.top.equalTo(fullNameLabel.snp.bottom).offset(30)
            make.leading.equalTo(view.snp.leading).offset(37)
            make.height.equalTo(19)
            make.width.equalTo(105)
        }
        
        emailTextField.snp.remakeConstraints { make in
            make.leading.equalTo(emailLabel.snp.trailing).offset(35)
            make.centerY.equalTo(emailLabel.snp.centerY)
            make.height.equalTo(19)
            make.width.equalTo(191)
        }
        
        emailAlarmLabel.snp.remakeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(5)
            make.leading.equalTo(view.snp.leading).offset(37)
            make.height.equalTo(11)
        }
        
        passwordLabel.snp.remakeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(30)
            make.leading.equalTo(view.snp.leading).offset(37)
            make.height.equalTo(19)
            make.width.equalTo(105)
        }
        
        passwordTextField.snp.remakeConstraints { make in
            make.leading.equalTo(passwordLabel.snp.trailing).offset(35)
            make.centerY.equalTo(passwordLabel.snp.centerY)
            make.height.equalTo(19)
            make.width.equalTo(191)
        }
        
        passwordAlarmLabel.snp.remakeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(5)
            make.leading.equalTo(view.snp.leading).offset(37)
            make.height.equalTo(11)
        }
        
        confirmPswLabel.snp.remakeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(30)
            make.leading.equalTo(view.snp.leading).offset(37)
            make.height.equalTo(19)
            make.width.equalTo(105)
        }
        
        confirmPswTextField.snp.remakeConstraints { make in
            make.leading.equalTo(confirmPswLabel.snp.trailing).offset(35)
            make.centerY.equalTo(confirmPswLabel.snp.centerY)
            make.height.equalTo(19)
            make.width.equalTo(191)
        }
        
        confirmPswAlarmLabel.snp.remakeConstraints { make in
            make.top.equalTo(confirmPswLabel.snp.bottom).offset(5)
            make.leading.equalTo(view.snp.leading).offset(37)
            make.height.equalTo(11)
        }
        
        bottomColorView.snp.remakeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.top.equalTo(confirmPswLabel.snp.bottom).offset(36)
        }
        
        createAccountButton.snp.remakeConstraints { make in
            make.centerY.equalTo(bottomColorView.snp.top).offset(3.5)
            make.height.equalTo(26)
            make.width.equalTo(137)
            make.centerX.equalTo(bottomColorView.snp.centerX)
        }
        
        questionLabel.snp.remakeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(47)
            make.bottom.equalTo(view.snp.bottom).offset(-35)
            make.height.equalTo(15)
        }
        
        signInButton.snp.remakeConstraints { make in
            make.leading.equalTo(questionLabel.snp.trailing).offset(5)
            make.centerY.equalTo(questionLabel.snp.centerY)
            make.height.equalTo(15)
        }
    }
    
    @objc private func pressButton() {
        fullNameTextFieldInfo()
        emailTextFieldInfo()
        passwordTextFieldInfo()
    }
    
    func fullNameTextFieldInfo() {
        guard let fullName = fullNameTextField.text, !fullName.isEmpty else {
            fullNameAlarmLabel.isHidden = false
            fullNameAlarmLabel.text = "Please enter some text"
            return
        }
        if !isValidFullName(fullName) {
            fullNameAlarmLabel.isHidden = false
            fullNameAlarmLabel.text = "Please enter English letters"
        } else {
            fullNameAlarmLabel.isHidden = true
            print("Account creation process initiated")
        }
    }
    private func isValidFullName(_ name: String) -> Bool {
        let allowedCharacters = CharacterSet.letters
        let characterSet = CharacterSet(charactersIn: name)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    func emailTextFieldInfo() {
        guard let email = emailTextField.text, !email.isEmpty else {
            emailAlarmLabel.isHidden = false
            emailAlarmLabel.text = "Enter email address."
            return
        }
        
        if !isValidEmail(email) {
            emailAlarmLabel.isHidden = false
            emailAlarmLabel.text = "Please enter a valid email address."
        } else {
            emailAlarmLabel.isHidden = true
            print("Account creation process initiated")
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func passwordTextFieldInfo() {
        // Validate password field is not empty
        guard let password = passwordTextField.text, !password.isEmpty else {
            passwordAlarmLabel.isHidden = false
            passwordAlarmLabel.text = "Please enter a password."
            return
        }
        
        // Validate password length
        if password.count < 6 {
            passwordAlarmLabel.isHidden = false
            passwordAlarmLabel.text = "Password should be more than 5 letters."
            return
        }
        
        // Validate password contains at least one capital letter
        if !containsCapitalLetter(password) {
            passwordAlarmLabel.isHidden = false
            passwordAlarmLabel.text = "Password should include at least one capital letter."
            return
        }
        
        // Validate password contains at least one number
        if !containsNumber(password) {
            passwordAlarmLabel.isHidden = false
            passwordAlarmLabel.text = "Password should include at least one number."
            return
        }
        
        passwordAlarmLabel.isHidden = true
        
        // Validate confirm password field is not empty
        guard let confirmPassword = confirmPswTextField.text, !confirmPassword.isEmpty else {
            confirmPswAlarmLabel.isHidden = false
            confirmPswAlarmLabel.text = "Please confirm your password."
            return
        }
        
        // Validate passwords match
        if password != confirmPassword {
            confirmPswAlarmLabel.isHidden = false
            confirmPswAlarmLabel.text = "Passwords do not match."
            return
        }
        
        confirmPswAlarmLabel.isHidden = true
        
        // Proceed with account creation
        print("Account creation process initiated")
    }
    private func containsCapitalLetter(_ password: String) -> Bool {
        let capitalLetterRegEx = ".*[A-Z]+.*"
        let capitalLetterTest = NSPredicate(format: "SELF MATCHES %@", capitalLetterRegEx)
        return capitalLetterTest.evaluate(with: password)
    }
    
    private func containsNumber(_ password: String) -> Bool {
        let numberRegEx = ".*[0-9]+.*"
        let numberTest = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        return numberTest.evaluate(with: password)
    }
}
