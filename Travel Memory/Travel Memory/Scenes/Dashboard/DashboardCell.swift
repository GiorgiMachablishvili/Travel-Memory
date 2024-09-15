//
//  DashboardCell.swift
//  Travel Memory
//
//  Created by Gio's Mac on 15.09.24.
//

import UIKit
import SnapKit

class DashboardCell: UICollectionViewCell {
    
//    static let identifier = "DashboardCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.KoronaOneRegular(size: 12)
        label.textAlignment = .center
        label.textColor = UIColor.black
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(5)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(15)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(98)
            make.width.equalTo(145)
        }
    }
    
    func configure(title: String, image: UIImage) {
        titleLabel.text = title
        imageView.image = image
    }
}

