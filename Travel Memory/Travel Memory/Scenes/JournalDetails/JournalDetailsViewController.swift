//
//  JournalDetailsViewController.swift
//  Travel Memory
//
//  Created by Irakli Kochua on 27.09.24.
//

import UIKit
import SnapKit
import Kingfisher

class JournalDetailsViewController: UIViewController {
    var selectedJournal: Journal
    
    private lazy var topColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(named: "backgroundPrimary")
        return view
    }()
    
    private lazy var sloganLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textAlignment = .center
        view.text = "Take a moment to review your journal before saving it. You can make any edits or additions here.".localized()
        return view
    }()
    
    private lazy var journalImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private lazy var journalLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var bottomColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .background
        return view
    }()
    
    private lazy var journalTitleLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textAlignment = .left
        view.text = "Journal Title :".localized()
        return view
    }()
    
    private lazy var journalTitleInfoLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textAlignment = .left
        return view
    }()
    
    private lazy var destinationLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textAlignment = .left
        view.text = "Destination :".localized()
        return view
    }()
    
    private lazy var destinationInfoLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textAlignment = .left
        view.text = ""
        return view
    }()
    
    private lazy var startDateLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textAlignment = .left
        view.text = "Start Date :".localized()
        return view
    }()
    
    private lazy var startDateInfoLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textAlignment = .left
        view.text = ""
        return view
    }()
    
    private lazy var endDateLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textAlignment = .left
        view.text = "End Date :".localized()
        return view
    }()
    
    private lazy var endDateInfoLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textAlignment = .left
        view.text = ""
        return view
    }()
    
    private lazy var lineImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "LineImage")
        return view
    }()
    
    private lazy var saveJournalButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Save Journal".localized(), for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.backgroundColor = .skyBlue
        view.layer.cornerRadius = 8
        view.addTarget(self, action: #selector(pressSaveJournalButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var editJournalButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Edit Journal".localized(), for: .normal)
        view.setTitleColor(.skyBlue, for: .normal)
        view.layer.cornerRadius = 8
        view.addTarget(self, action: #selector(pressEditJournalButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var shareJournalButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Share journal".localized(), for: .normal)
        view.setTitleColor(.skyBlue, for: .normal)
        view.layer.cornerRadius = 8
        view.addTarget(self, action: #selector(pressShareJournalButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var cancelButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Cancel".localized(), for: .normal)
        view.setTitleColor(.skyBlue, for: .normal)
        view.layer.cornerRadius = 8
        view.addTarget(self, action: #selector(pressCancelButton), for: .touchUpInside)
        return view
    }()
    
    init(selectedJournal: Journal) {
        self.selectedJournal = selectedJournal
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupLayout()
        populateJournalDetails()
        view.backgroundColor = .systemBackground
        
    }
    
    private func setup() {
        view.addSubview(topColorView)
        topColorView.addSubview(sloganLabel)
        view.addSubview(journalImage)
        view.addSubview(journalLabel)
        view.addSubview(bottomColorView)
        bottomColorView.addSubview(journalTitleLabel)
        bottomColorView.addSubview(journalTitleInfoLabel)
        bottomColorView.addSubview(destinationLabel)
        bottomColorView.addSubview(destinationInfoLabel)
        bottomColorView.addSubview(startDateLabel)
        bottomColorView.addSubview(startDateInfoLabel)
        bottomColorView.addSubview(endDateLabel)
        bottomColorView.addSubview(endDateInfoLabel)
        bottomColorView.addSubview(lineImageView)
        bottomColorView.addSubview(saveJournalButton)
        bottomColorView.addSubview(editJournalButton)
        bottomColorView.addSubview(shareJournalButton)
        bottomColorView.addSubview(cancelButton)
    }
    
    private func setupLayout() {
        topColorView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(292 * Constraint.yCoeff)
        }
        
        sloganLabel.snp.remakeConstraints { make in
            make.top.equalTo(topColorView.snp.top).offset(135)
            make.centerX.equalTo(topColorView.snp.centerX)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        journalImage.snp.remakeConstraints { make in
            make.top.equalTo(topColorView.snp.bottom).offset(20)
            make.centerX.equalTo(topColorView.snp.centerX)
            make.width.equalTo(145)
            make.height.equalTo(100)
        }
        
        bottomColorView.snp.remakeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(292)
        }
        
        journalTitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(bottomColorView.snp.top).offset(10)
            make.leading.equalTo(view.snp.leading).offset(81)
            make.height.equalTo(20)
            make.width.equalTo(125)
        }
        
        journalTitleInfoLabel.snp.makeConstraints { make in
            make.centerY.equalTo(journalTitleLabel.snp.centerY)
            make.leading.equalTo(journalTitleLabel.snp.trailing).offset(15)
            make.height.equalTo(20)
        }
        
        destinationLabel.snp.remakeConstraints { make in
            make.top.equalTo(journalTitleLabel.snp.bottom).offset(10)
            make.leading.equalTo(view.snp.leading).offset(81)
            make.height.equalTo(20)
            make.width.equalTo(125)
        }
        
        destinationInfoLabel.snp.makeConstraints { make in
            make.centerY.equalTo(destinationLabel.snp.centerY)
            make.leading.equalTo(destinationLabel.snp.trailing).offset(15)
            make.height.equalTo(20)
        }
        
        startDateLabel.snp.remakeConstraints { make in
            make.top.equalTo(destinationLabel.snp.bottom).offset(10)
            make.leading.equalTo(view.snp.leading).offset(81)
            make.height.equalTo(20)
            make.width.equalTo(125)
        }
        
        startDateInfoLabel.snp.makeConstraints { make in
            make.centerY.equalTo(startDateLabel.snp.centerY)
            make.leading.equalTo(startDateLabel.snp.trailing).offset(15)
            make.height.equalTo(20)
        }
        
        endDateLabel.snp.remakeConstraints { make in
            make.top.equalTo(startDateLabel.snp.bottom).offset(10)
            make.leading.equalTo(view.snp.leading).offset(81)
            make.height.equalTo(20)
            make.width.equalTo(125)
        }
        
        endDateInfoLabel.snp.makeConstraints { make in
            make.centerY.equalTo(endDateLabel.snp.centerY)
            make.leading.equalTo(endDateLabel.snp.trailing).offset(15)
            make.height.equalTo(20)
        }
        
        lineImageView.snp.remakeConstraints { make in
            make.top.equalTo(endDateInfoLabel.snp.bottom).offset(5)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(1)
        }
        
        saveJournalButton.snp.remakeConstraints { make in
            make.top.equalTo(lineImageView.snp.bottom).offset(20)
            make.leading.equalTo(view.snp.leading).offset(56)
            make.height.equalTo(27)
            make.width.equalTo(150)
        }
        
        editJournalButton.snp.remakeConstraints { make in
            make.top.equalTo(saveJournalButton.snp.bottom).offset(15)
            make.leading.equalTo(view.snp.leading).offset(56)
            make.height.equalTo(27)
            make.width.equalTo(150)
        }
        
        shareJournalButton.snp.remakeConstraints { make in
            make.top.equalTo(saveJournalButton.snp.bottom).offset(15)
            make.trailing.equalTo(view.snp.trailing).offset(-56)
            make.height.equalTo(27)
            make.width.equalTo(150)
        }
        
        cancelButton.snp.remakeConstraints { make in
            make.top.equalTo(editJournalButton.snp.bottom).offset(15)
            make.leading.equalTo(view.snp.leading).offset(56)
            make.height.equalTo(27)
            make.width.equalTo(150)
        }
    }
    
    @objc func pressSaveJournalButton() {
        
    }
    
    @objc func pressEditJournalButton() {
        
    }
    
    @objc func pressShareJournalButton() {
        
    }
    
    @objc func pressCancelButton() {
        
    }
    
    private func populateJournalDetails() {
//        journalLabel.text = selectedJournal.noteTextField
        journalTitleInfoLabel.text = selectedJournal.title
        destinationInfoLabel.text = selectedJournal.dateModified
        startDateInfoLabel.text = selectedJournal.startDate
        endDateInfoLabel.text = selectedJournal.endDate
        
        if let url = URL(string: selectedJournal.imageUrl) {
            journalImage.kf.setImage(with: url)
        }
    }
}
