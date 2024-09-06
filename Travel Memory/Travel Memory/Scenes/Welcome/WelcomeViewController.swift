//
//  WelcomeViewController.swift
//  Travel Memory
//
//  Created by Irakli Kochua on 03.09.24.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    private lazy var logoView: LogoView = {
        let view = LogoView()
        return view
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to travel Memory Journal!"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        return button
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "or"
        label.textAlignment = .center
        return label
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(hexString: "0371F2").withAlphaComponent(25)
        signUpButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(goToSignInPage), for: .touchUpInside)
        
        setup()
        layout()
    }
    
    private func setup() {
        view.addSubview(logoView)
        view.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(signInButton)
        containerView.addSubview(textLabel)
        containerView.addSubview(signUpButton)
    }
    
    private func layout() {
        logoView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(101)
            make.centerX.equalToSuperview()
        }
        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.width.equalTo(300)  // Adjust as needed
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.equalToSuperview().inset(16)
        }
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(16)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    @objc private func signInButtonTapped() {
        let signupVC = SignUpViewController()
        
        // If you're using a UINavigationController
        if let navigationController = navigationController {
            navigationController.pushViewController(signupVC, animated: true)
        }
    }
    
    @objc private func goToSignInPage() {
        let signInVC = SignInController()
        
        navigationController?.pushViewController(signInVC, animated: true)
    }
}
