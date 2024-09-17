//
//  CreateNewJournalController.swift
//  Travel Memory
//
//  Created by Gio's Mac on 17.09.24.
//

import UIKit
import SnapKit

class CreateNewJournalController: UIViewController {
    
    //MARK: -UI components
    private lazy var topColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .background
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 24)
        view.textColor = .black
        view.textAlignment = .center
        view.text = "Create new journal"
        return view
    }()
    
    private lazy var sloganLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textColor = .black
        view.textAlignment = .center
        view.text = "Let’s start creating your new travel journal!"
        return view
    }()
    
    private let journalTitle = MyTextFieldView(label: "Journal Title")
    
    private let destinationField = MyTextFieldView(label: "Destination")
    
    private let startDateField = MyTextFieldView(label: "Start Date")
    
    private let endDate = MyTextFieldView(label: "End Date")
    
    private lazy var bottomColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .background
        return view
    }()
    
    private lazy var continueButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Continue", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.backgroundColor = .skyBlue.withAlphaComponent(25)
        view.layer.cornerRadius = 8
        view.addTarget(self, action: #selector(pressContinueButton), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupConstraints()
        
        view.backgroundColor = .systemBackground
    }
    
    private func setupLayout() {
        view.addSubview(topColorView)
        topColorView.addSubview(nameLabel)
        topColorView.addSubview(sloganLabel)
        view.addSubview(journalTitle)
        view.addSubview(destinationField)
        view.addSubview(startDateField)
        view.addSubview(endDate)
        view.addSubview(bottomColorView)
        bottomColorView.addSubview(continueButton)
    }
    
    private func setupConstraints() {
        topColorView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(292 * Constraint.yCoeff)
        }
        
        nameLabel.snp.remakeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.snp.top).offset(142)
            make.height.equalTo(30)
        }
        
        sloganLabel.snp.remakeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(nameLabel.snp.bottom).offset(90)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(20)
        }
        
        journalTitle.snp.remakeConstraints { make in
            make.top.equalTo(topColorView.snp.bottom).offset(56)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        destinationField.snp.remakeConstraints { make in
            make.top.equalTo(journalTitle.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        startDateField.snp.remakeConstraints { make in
            make.top.equalTo(destinationField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        endDate.snp.remakeConstraints { make in
            make.top.equalTo(startDateField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        bottomColorView.snp.remakeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(292)
        }
        
        continueButton.snp.remakeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(bottomColorView.snp.top).offset(63)
            make.height.equalTo(27)
            make.width.equalTo(150)
        }
    }
    
    
    @objc func pressContinueButton() {
        
    }
    
}
