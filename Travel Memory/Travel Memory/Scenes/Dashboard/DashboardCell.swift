//
//  DashboardCell.swift
//  Travel Memory
//
//  Created by Gio's Mac on 15.09.24.
//

import UIKit
import SnapKit

protocol DashboardCellDelegate: AnyObject {
    func didPressDeleteButton(at indexPath: IndexPath)
}

class DashboardCell: UICollectionViewCell {
    
    weak var delegate: DashboardCellDelegate?
    private var indexPath: IndexPath?
    
    private lazy var deleteButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "deleteButton"), for: .normal)
        view.isHidden = true
        view.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
        return view
    }()
    
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
        contentView.addSubview(deleteButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
    }
    
    private func setupConstraints() {
        deleteButton.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(-2)
            make.trailing.equalTo(snp.trailing).offset(-2)
            make.height.width.equalTo(25)
        }
        
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
    
    func configure(title: String, image: UIImage, indexPath: IndexPath) {
        titleLabel.text = title
        imageView.image = image
        self.indexPath = indexPath
    }
    
    func setDeleteButtonVisibility(isVisible: Bool) {
        deleteButton.isHidden = !isVisible
    }
    
    @objc private func deleteButtonPressed() {
        guard let indexPath = indexPath else { return }
        delegate?.didPressDeleteButton(at: indexPath)
    }
}


