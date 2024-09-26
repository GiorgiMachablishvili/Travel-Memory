//
//  DashboardBottomButtonView.swift
//  Travel Memory
//
//  Created by Gio's Mac on 15.09.24.
//

import UIKit
import SnapKit

class DashboardBottomButtonView: UIView {
    
    weak var delegate: DashboardBottomButtonViewDelegate?
    
    private let createFolderButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(named: "create_folder"), for: .normal)
        view.tintColor = UIColor.black
        return view
    }()
    
    private let addFolderButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(named: "add_folder"), for: .normal)
        view.tintColor = UIColor.black
        return view
    }()
    
    private let managementButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(named: "management"), for: .normal)
        view.tintColor = UIColor.black
        return view
    }()
    
    private let shareButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(named: "share"), for: .normal)
        view.tintColor = UIColor.black
        return view
    }()
    
    private let logoutButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(named: "logout"), for: .normal)
        view.tintColor = UIColor.black
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraints()
        
        createFolderButton.addTarget(self, action: #selector(didPressCreateFolderButton), for: .touchUpInside)
        addFolderButton.addTarget(self, action: #selector(didPressAddFolderButton), for: .touchUpInside)
        logoutButton.addTarget(self, action: #selector(didPressLogoutButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        addSubview(createFolderButton)
        addSubview(addFolderButton)
        addSubview(managementButton)
        addSubview(shareButton)
        addSubview(logoutButton)
    }
    
    private func setupConstraints() {
        createFolderButton.snp.remakeConstraints { make in
            make.leading.equalTo(snp.leading).offset(32)
            make.bottom.equalTo(snp.bottom).offset(-18)
            make.height.width.equalTo(56)
        }
        
        addFolderButton.snp.remakeConstraints { make in
            make.leading.equalTo(createFolderButton.snp.trailing).offset(10)
            make.centerY.equalTo(createFolderButton.snp.centerY)
            make.height.width.equalTo(59)
        }
        
        managementButton.snp.remakeConstraints { make in
            make.leading.equalTo(addFolderButton.snp.trailing).offset(10)
            make.centerY.equalTo(createFolderButton.snp.centerY)
            make.height.width.equalTo(70)
        }
        
        shareButton.snp.remakeConstraints { make in
            make.leading.equalTo(managementButton.snp.trailing).offset(10)
            make.centerY.equalTo(createFolderButton.snp.centerY)
            make.height.width.equalTo(49)
        }
        
        logoutButton.snp.remakeConstraints { make in
            make.leading.equalTo(shareButton.snp.trailing).offset(10)
            make.centerY.equalTo(createFolderButton.snp.centerY)
            make.height.width.equalTo(50)
        }
    }
    
    @objc private func didPressCreateFolderButton() {
        delegate?.didPressCreateFolderButton()
    }
    
    @objc private func didPressAddFolderButton() {
        delegate?.didPressAddFolderButton()
    }
    
    @objc private func didPressLogoutButton() {
        delegate?.didPressLogoutButton()
    }
}

