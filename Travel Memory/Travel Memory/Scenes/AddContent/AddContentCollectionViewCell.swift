//
//  AddContentCollectionViewCell.swift
//  Travel Memory
//
//  Created by Gio's Mac on 18.09.24.
//

import UIKit
import SnapKit

class AddContentCollectionViewCell: UICollectionViewCell {
    private lazy var journalTitleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textColor = .black
        view.textAlignment = .left
        view.text = "Journal Title :"
        return view
    }()
    
    private lazy var journalTitleInfoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textColor = .black
        view.textAlignment = .left
        return view
    }()
    
    private lazy var destinationLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textColor = .black
        view.textAlignment = .left
        view.text = "Destination :"
        return view
    }()
    
    private lazy var destinationInfoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textColor = .black
        view.textAlignment = .left
        view.text = "Destination :"
        return view
    }()
    
    private lazy var startDateLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textColor = .black
        view.textAlignment = .left
        view.text = "Start Date :"
        return view
    }()
    
    private lazy var startDateInfoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textColor = .black
        view.textAlignment = .left
        view.text = "Start Date :"
        return view
    }()
    
    private lazy var endDateLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textColor = .black
        view.textAlignment = .left
        view.text = "End Date :"
        return view
    }()
    
    private lazy var endDateInfoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textColor = .black
        view.textAlignment = .left
        view.text = "End Date :"
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setJournalInfo(journalTitle: String, destination: String, startDate: String, endDate: String) {
            journalTitleInfoLabel.text = journalTitle
            destinationInfoLabel.text = destination
            startDateInfoLabel.text = startDate
            endDateInfoLabel.text = endDate
        }
    
    private func setupLayout() {
        addSubview(journalTitleLabel)
        addSubview(journalTitleInfoLabel)
        addSubview(destinationLabel)
        addSubview(destinationInfoLabel)
        addSubview(startDateLabel)
        addSubview(startDateInfoLabel)
        addSubview(endDateLabel)
        addSubview(endDateInfoLabel)
    }
    
    private func setupConstraints() {
        journalTitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(20)
            make.leading.equalTo(snp.leading).offset(20)
            make.height.equalTo(14)
        }
        
        journalTitleInfoLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(journalTitleLabel.snp.centerY)
            make.leading.equalTo(journalTitleLabel.snp.trailing).offset(20)
            make.height.equalTo(14)
        }
        
        destinationLabel.snp.remakeConstraints { make in
            make.top.equalTo(journalTitleLabel.snp.bottom).offset(20)
            make.leading.equalTo(snp.leading).offset(20)
            make.height.equalTo(14)
        }
        
        destinationInfoLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(destinationLabel.snp.centerY)
            make.leading.equalTo(destinationLabel.snp.trailing).offset(20)
            make.height.equalTo(14)
        }
        
        startDateLabel.snp.remakeConstraints { make in
            make.top.equalTo(destinationLabel.snp.bottom).offset(20)
            make.leading.equalTo(snp.leading).offset(20)
            make.height.equalTo(14)
        }
        
        startDateInfoLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(startDateLabel.snp.centerY)
            make.leading.equalTo(startDateLabel.snp.trailing).offset(20)
            make.height.equalTo(14)
        }
        
        endDateLabel.snp.remakeConstraints { make in
            make.top.equalTo(startDateLabel.snp.bottom).offset(20)
            make.leading.equalTo(snp.leading).offset(20)
            make.height.equalTo(14)
        }
        
        endDateInfoLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(endDateLabel.snp.centerY)
            make.leading.equalTo(endDateLabel.snp.trailing).offset(20)
            make.height.equalTo(14)
        }
    }
}
