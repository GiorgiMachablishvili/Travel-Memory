//
//  TestFieldWithLabel.swift
//  Travel Memory
//
//  Created by Gio's Mac on 06.09.24.
//

import UIKit
import SnapKit

class TextFieldWithLabelView: UIView {
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
        view.backgroundColor = .skyBlue
        view.layer.cornerRadius = 8
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHierarchy() {
        addSubview(fullNameLabel)
        addSubview(fullNameTextField)
    }
    
    func setupConstraints() {
        fullNameLabel.snp.remakeConstraints { make in
            make.top.equalTo(snp.bottom).offset(30)
            make.leading.equalTo(snp.leading).offset(37)
            make.height.equalTo(19)
            make.width.equalTo(105)
        }
        
        fullNameTextField.snp.remakeConstraints { make in
            make.leading.equalTo(fullNameLabel.snp.trailing).offset(35)
            make.centerY.equalTo(fullNameLabel.snp.centerY)
            make.height.equalTo(19)
            make.width.equalTo(191)
        }
    }
}
