//
//  JournalDetailsViewController.swift
//  Travel Memory
//
//  Created by Irakli Kochua on 27.09.24.
//

import UIKit
import SnapKit

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
        view.text = "Take a moment to review your journal before saving it. You can make any edits or additions here."
        return view
    }()
    
    private lazy var journalImage: UIImageView = {
        let view = UIImageView(frame: .zero)

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
        view.text = "Journal Title :"
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
        view.text = "Destination :"
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
        view.text = "Start Date :"
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
        view.text = "End Date :"
        return view
    }()
    
    private lazy var endDateInfoLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textAlignment = .left
        view.text = ""
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
            make.top.equalTo(topColorView.snp.top).offset(5)
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
    }
}
