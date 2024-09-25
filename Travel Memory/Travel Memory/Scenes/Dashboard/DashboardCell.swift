//
//  DashboardCell.swift
//  Travel Memory
//
//  Created by Gio's Mac on 15.09.24.
//

import UIKit
import SnapKit
import Kingfisher

class DashboardCell: UICollectionViewCell {
        
    private lazy var titleLabel: MyLabel = {
        let label = MyLabel()
        label.font = UIFont.KoronaOneRegular(size: 12)
        label.textAlignment = .center
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
    
    func configure(title: String, imageUrl: String) {
        let url = URL(string: imageUrl)
        imageView.kf.setImage(with: url)
        titleLabel.text = title
    }
}

