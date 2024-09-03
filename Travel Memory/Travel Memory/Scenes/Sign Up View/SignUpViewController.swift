//
//  SignUpViewController.swift
//  Travel Memory
//
//  Created by Gio's Mac on 03.09.24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    //MARK: -UI components
    private lazy var topColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.init(hexString: "0371F2")
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
        view.font = UIFont.KoronaOneRegular(size: 24)
        view.textColor = UIColor.init(hexString: "000000")
        view.textAlignment = .right
        view.numberOfLines = 2
        view.text = "Please fill in the following information to create your account:"
        return view
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.textColor = UIColor.init(hexString: "000000")
        view.textAlignment = .right
        view.text = "Full name:"
        return view
    }()
    
    private lazy var fullNameTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 15)
        return view
    }()
    
    private lazy var emailLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.textColor = UIColor.init(hexString: "000000")
        view.textAlignment = .right
        view.text = "Email:"
        return view
    }()
    
    private lazy var emailTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 15)
        return view
    }()
    
    private lazy var passwordLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.textColor = UIColor.init(hexString: "000000")
        view.textAlignment = .right
        view.text = "Password:"
        return view
    }()
    
    private lazy var passwordTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 15)
        return view
    }()
    
    private lazy var confirmPswLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.textColor = UIColor.init(hexString: "000000")
        view.textAlignment = .right
        view.text = "Confirm Psw:"
        return view
    }()
    
    private lazy var confirmPswTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 15)
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
        view.backgroundColor = UIColor.init(hexString: "000000").withAlphaComponent(25)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
