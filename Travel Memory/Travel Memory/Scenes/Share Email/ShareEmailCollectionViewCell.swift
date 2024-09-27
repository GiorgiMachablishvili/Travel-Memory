//
//  ShareEmailCollectionViewCell.swift
//  Travel Memory
//
//  Created by Gio's Mac on 26.09.24.
//

import UIKit
import SnapKit

class ShareEmailCollectionViewCell: UICollectionViewCell {
    private lazy var frameImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "checkButtonFraim")
        return view
    }()
    
    private lazy var checkButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "checkPoint"), for: .normal)
        view.backgroundColor = .systemBackground
        view.isHidden = true
        return view
    }()
    
    private lazy var journalInfo: MyLabel = {
        let view = MyLabel()
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textAlignment = .left
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(frameImageView)
        frameImageView.addSubview(checkButton)
        addSubview(journalInfo)
    }
    
    private func setupLayout() {
        frameImageView.snp.remakeConstraints { make in
            make.top.leading.equalToSuperview().offset(20)
            make.bottom.equalTo(snp.bottom).offset(-20)
            make.height.width.equalTo(13)
        }
        
        checkButton.snp.remakeConstraints { make in
            make.edges.equalTo(3)
        }
        
        journalInfo.snp.remakeConstraints { make in
            make.centerY.equalTo(frameImageView.snp.centerY)
            make.leading.equalTo(frameImageView.snp.trailing).offset(15)
            make.height.equalTo(20)
        }
    }
    
    func configure(journalInfoText: String, frameView: UIImage, checkImage: UIImage?) {
        journalInfo.text = journalInfoText
        frameImageView.image = frameView
        if let checkImage = checkImage {
            checkButton.setImage(UIImage(named: "checkPoint"), for: .normal)
        }
    }
}
