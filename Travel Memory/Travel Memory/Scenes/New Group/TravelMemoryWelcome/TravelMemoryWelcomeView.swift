//
//  TravelMemoryWelcomeView.swift
//  Travel Memory
//
//  Created by Gio's Mac on 06.09.24.
//

import UIKit
import SnapKit

class TravelMemoryWelcomeView: UIViewController {
    
    //MARK: -UI components
    private lazy var topColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .background
        return view
    }()
    
    private lazy var logoImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "flight")
        return view
    }()
    
    private lazy var nameLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 20)
        view.textAlignment = .center
        view.text = "TRAVEL MEMORY"
        return view
    }()
    
    private lazy var sloganLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 14)
        view.textAlignment = .center
        view.text = "Welcome to Travel Memory Journal!"
        return view
    }()
    
    private lazy var signInApproveLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 14)
        view.textAlignment = .center
        view.numberOfLines = 2
        view.text = "Congratulations, your account has been successfully created"
        return view
    }()
    
    private lazy var infoLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 14)
        view.textAlignment = .center
        view.numberOfLines = 3
        view.text = "You are now ready to start capturing, organizing, and sharing your travel memories with our app."
        return view
    }()
    
    private lazy var bottomColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .background
        return view
    }()
    
    private lazy var getStartedButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Get Started", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = UIFont.KoronaOneRegular(size: 12)
        view.clipsToBounds = true
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
        view.backgroundColor = .systemBackground
    }
    
    func setup() {
        view.addSubview(topColorView)
        topColorView.addSubview(logoImage)
        topColorView.addSubview(nameLabel)
        topColorView.addSubview(sloganLabel)
        view.addSubview(signInApproveLabel)
        view.addSubview(infoLabel)
        view.addSubview(bottomColorView)
        bottomColorView.addSubview(getStartedButton)
    }
    
    func setupConstraints() {
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
        
        signInApproveLabel.snp.remakeConstraints { make in
            make.top.equalTo(topColorView.snp.bottom).offset(50)
            make.centerX.equalTo(view.snp.centerX)
            make.leading.trailing.equalToSuperview().inset(39)
        }
        
        infoLabel.snp.remakeConstraints { make in
            make.top.equalTo(signInApproveLabel.snp.bottom).offset(30)
            make.centerX.equalTo(view.snp.centerX)
            make.leading.trailing.equalToSuperview().inset(39)
        }
        
        bottomColorView.snp.remakeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(292)
        }
        
        getStartedButton.snp.remakeConstraints { make in
            make.height.equalTo(26)
            make.width.equalTo(146)
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(bottomColorView.snp.top).offset(39)
        }
    }

}
