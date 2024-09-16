//
//  SignUpViewController.swift
//  Travel Memory
//
//  Created by Gio's Mac on 03.09.24.
//


import UIKit
import SnapKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    // ViewModel
    private var viewModel = SignUpViewModel()
    private let authManager = AuthManager()
    
    //MARK: -UI components
    private lazy var topColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .background
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
        view.textColor = .black
        view.textAlignment = .center
        view.text = "TRAVEL MEMORY"
        return view
    }()
    
    private lazy var sloganLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.textColor = .black
        view.textAlignment = .center
        view.text = "JOURNAL"
        return view
    }()
    
    private lazy var signupLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 24)
        view.textColor = .black
        view.textAlignment = .center
        view.text = "Sign Up"
        return view
    }()
    
    private lazy var infoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 14)
        view.textColor = .black
        view.textAlignment = .left
        view.numberOfLines = 2
        view.text = "Please fill in the following information to create your account:"
        return view
    }()
    
    private let fullNameField = MyTextFieldView(label: "Full name:")
    
    private lazy var fullNameAlarmLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 9)
        view.textColor = .red
        view.textAlignment = .left
        view.isHidden = true
        return view
    }()
    
    private let emailField = MyTextFieldView(label: "Email:")
    
    private lazy var emailAlarmLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 9)
        view.textColor = .red
        view.textAlignment = .left
        view.isHidden = true
        return view
    }()
    
    private let passwordField = MyTextFieldView(label: "Password:", isSecured: true, hasPasswordVisibility: true)
    
    private lazy var passwordAlarmLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 9)
        view.textColor = .red
        view.textAlignment = .left
        view.isHidden = true
        return view
    }()
    
    private let passwordConfirmField = MyTextFieldView(label: "Confirm psw:", isSecured: true, hasPasswordVisibility: true)
    
    private lazy var confirmPswAlarmLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 9)
        view.textColor = .skyBlue
        view.textAlignment = .left
        view.isHidden = true
        return view
    }()
    
    private lazy var bottomColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .background
        return view
    }()
    
    private lazy var createAccountButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Create Account", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.backgroundColor = .skyBlue.withAlphaComponent(25)
        view.layer.cornerRadius = 8
        view.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var questionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textColor = .black
        view.textAlignment = .left
        view.text = "Already have an account?"
        return view
    }()
    
    private lazy var signInButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Sign In", for: .normal)
        view.setTitleColor(.black, for: .normal)
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
        view.addSubview(fullNameField)
        view.addSubview(fullNameAlarmLabel)
        view.addSubview(emailField)
        view.addSubview(emailAlarmLabel)
        view.addSubview(passwordField)
        view.addSubview(passwordAlarmLabel)
        view.addSubview(passwordConfirmField)
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
        
        fullNameField.snp.remakeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(30)
            make.leading.equalTo(view.snp.leading).offset(37)
            make.trailing.equalTo(view.snp.trailing).offset(-37)
        }
        
        fullNameAlarmLabel.snp.remakeConstraints { make in
            make.top.equalTo(fullNameField.snp.bottom).offset(5)
            make.leading.equalTo(view.snp.leading).offset(37)
            make.height.equalTo(11)
        }
        
        emailField.snp.remakeConstraints { make in
            make.top.equalTo(fullNameField.snp.bottom).offset(30)
            make.leading.equalTo(view.snp.leading).offset(37)
            make.trailing.equalTo(view.snp.trailing).offset(-37)
        }
        
        emailAlarmLabel.snp.remakeConstraints { make in
            make.top.equalTo(emailField.snp.bottom).offset(5)
            make.leading.equalTo(view.snp.leading).offset(37)
            make.height.equalTo(11)
        }
        
        passwordField.snp.remakeConstraints { make in
            make.top.equalTo(emailField.snp.bottom).offset(30)
            make.leading.equalTo(view.snp.leading).offset(37)
            make.trailing.equalTo(view.snp.trailing).offset(-37)
        }
        
        passwordAlarmLabel.snp.remakeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(5)
            make.leading.equalTo(view.snp.leading).offset(37)
            make.height.equalTo(11)
        }
        
        passwordConfirmField.snp.remakeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(30)
            make.leading.equalTo(view.snp.leading).offset(37)
            make.trailing.equalTo(view.snp.trailing).offset(-37)
        }
        
        confirmPswAlarmLabel.snp.remakeConstraints { make in
            make.top.equalTo(passwordConfirmField.snp.bottom).offset(5)
            make.leading.equalTo(view.snp.leading).offset(37)
            make.height.equalTo(11)
        }
        
        bottomColorView.snp.remakeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.top.equalTo(passwordConfirmField.snp.bottom).offset(36)
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
        viewModel.didPressSignupButton(
            fullName: fullNameField.text,
            email: emailField.text,
            password: passwordField.text,
            confirmPassword: passwordConfirmField.text
        ) { [weak self] result in
            switch result {
            case .success:
                print("Account created successfully")
                let signInController = DashboardViewController()
                self?.navigationController?.pushViewController(signInController, animated: true)
            case .failure(let error):
                self?.handleSignupError(error)
            }
        }
    }
    
    private func handleSignupError(_ error: SignUpViewModel.SignUpError) {
        switch error {
        case .fullName:
            fullNameAlarmLabel.isHidden = false
            fullNameAlarmLabel.text = viewModel.fullNameAlarmMessage
        case .email:
            emailAlarmLabel.isHidden = false
            emailAlarmLabel.text = viewModel.emailAlarmMessage
        case .password:
            passwordAlarmLabel.isHidden = false
            passwordAlarmLabel.text = viewModel.passwordAlarmMessage
        case .confirmPassword:
            confirmPswAlarmLabel.isHidden = false
            confirmPswAlarmLabel.text = viewModel.confirmPasswordAlarmMessage
        case .auth(let message):
            let alert = UIAlertController(title: "Sign Up Failed", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}


