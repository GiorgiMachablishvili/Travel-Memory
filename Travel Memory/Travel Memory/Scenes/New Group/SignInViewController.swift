//
//  SignInController.swift
//  Travel Memory
//
//  Created by Gio's Mac on 05.09.24.
//

import UIKit
import SnapKit

class SignInController: UIViewController {
    private var viewModel = SignInViewModel()
    
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
    
    private lazy var signInLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 24)
        view.textColor = .black
        view.textAlignment = .center
        view.text = "Sign In"
        return view
    }()
    
    private let emailField = MyTextFieldView(label: "Email")
    private let passwordField = MyTextFieldView(label: "Password:", isSecured: true, hasPasswordVisibility: true)
    
    private lazy var signIntEnterButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Sign In", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.backgroundColor = .skyBlue.withAlphaComponent(25)
        view.layer.cornerRadius = 8
        view.addTarget(self, action: #selector(pressSignInButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var bottomColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .background
        return view
    }()
    
    private lazy var questionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textColor = .black
        view.textAlignment = .left
        view.text = "Forget Password?"
        return view
    }()
    
    private lazy var signInButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Sign Up", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = UIFont.KoronaOneRegular(size: 12)
        view.clipsToBounds = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupLayout()
        view.backgroundColor = .systemBackground
    }
    
    func setup() {
        view.addSubview(topColorView)
        topColorView.addSubview(logoImage)
        topColorView.addSubview(nameLabel)
        topColorView.addSubview(sloganLabel)
        topColorView.addSubview(signInLabel)
        view.addSubview(passwordField)
        view.addSubview(emailField)
        view.addSubview(bottomColorView)
        bottomColorView.addSubview(signIntEnterButton)
        bottomColorView.addSubview(questionLabel)
        bottomColorView.addSubview(signInButton)
    }
    
    func setupLayout() {
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
        
        signInLabel.snp.remakeConstraints { make in
            make.top.equalTo(sloganLabel.snp.bottom).offset(18)
            make.centerX.equalTo(topColorView.snp.centerX)
            make.height.equalTo(30)
            make.width.equalTo(123)
        }
        
        emailField.snp.remakeConstraints { make in
            make.top.equalTo(topColorView.snp.bottom).offset(58)
            make.leading.equalTo(view.snp.leading).offset(Constants.fieldLeading)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(24)
        }
        
        passwordField.snp.remakeConstraints { make in
            make.top.equalTo(emailField.snp.bottom).offset(58)
            make.leading.equalTo(view.snp.leading).offset(Constants.fieldLeading)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(24)
        }
        
        signIntEnterButton.snp.remakeConstraints { make in
            make.height.equalTo(26)
            make.width.equalTo(96)
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(bottomColorView.snp.top).offset(39)
        }
        
        bottomColorView.snp.remakeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(292)
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
    
    @objc func pressSignInButton () {
        viewModel.pressSignInButton(email: emailField.text, password: passwordField.text) { result in
            switch result {
            case .success:
                let welcomeVC = TravelMemoryWelcomeView()
                self.navigationController?.pushViewController(welcomeVC, animated: true)
            case .failure(let error):
                let alert = UIAlertController(
                    title: "Sign In Failed",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
            }
            
            let welcomeVC = DashboardViewController()
            self.navigationController?.pushViewController(welcomeVC, animated: true)
        }
    }
    
}

private extension SignInController {
    enum Constants {
        static let fieldLeading: CGFloat = 38
    }
}
