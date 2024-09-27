//
//  ShareEmailViewController.swift
//  Travel Memory
//
//  Created by Gio's Mac on 26.09.24.
//

import UIKit
import SnapKit

class ShareEmailViewController: UIViewController {
    
    var journalTitle: String?
    
    var journals: [Journal] = []
    var journalTitles: [String] {
        journals.map { $0.title }
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 128, height: 328)
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero  , collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(ShareEmailCollectionViewCell.self, forCellWithReuseIdentifier: "ShareEmailCollectionViewCell")
        return collectionView
    }()
    
    private lazy var topColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .background
        return view
    }()
    
    private lazy var nameLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 14)
        view.textAlignment = .center
        view.text = "Share with friends"
        return view
    }()
    
    private lazy var sloganLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textAlignment = .center
        view.numberOfLines = 2
        view.text = "Share your travel journal or trip with friends and family."
        return view
    }()
    
    private lazy var lineImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "LineImage")
        return view
    }()
    
    private lazy var bottomColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .background
        return view
    }()
    
    private lazy var toLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 14)
        view.textAlignment = .center
        view.text = "To: "
        return view
    }()
    
    private lazy var emailField: UITextField = {
        let view = UITextField(frame: .zero)
        view.backgroundColor = UIColor.skyBlue
        view.placeholder = "type email...."
        view.keyboardType = .emailAddress
        return view
    }()
    
    private lazy var sendEmailButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Send Email", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.backgroundColor = .skyBlue
        view.layer.cornerRadius = 2
        view.addTarget(self, action: #selector(sendEmailButtonPressed), for: .touchUpInside)
        return view
    }()
    
    private lazy var cancelButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Cancel", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.backgroundColor = .skyBlue
        view.layer.cornerRadius = 2
        view.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupLayout()
        
//        nameLabel.text = journalTitle
        
        collectionView.reloadData()
        
        view.backgroundColor = .systemBackground
    }
    
    private func setup() {
        view.addSubview(topColorView)
        topColorView.addSubview(nameLabel)
        topColorView.addSubview(sloganLabel)
        view.addSubview(lineImageView)
        view.addSubview(bottomColorView)
        bottomColorView.addSubview(toLabel)
        bottomColorView.addSubview(emailField)
        bottomColorView.addSubview(sendEmailButton)
        bottomColorView.addSubview(cancelButton)
    }
    
    private func setupLayout() {
        topColorView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(292 * Constraint.yCoeff)
        }
        
        nameLabel.snp.remakeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.snp.top).offset(122)
            make.height.equalTo(30)
        }
        
        sloganLabel.snp.remakeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(nameLabel.snp.bottom).offset(70)
            make.leading.trailing.equalToSuperview().inset(25)
        }
        
        lineImageView.snp.remakeConstraints { make in
            make.bottom.equalTo(bottomColorView.snp.top).offset(-10)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(294)
            make.height.equalTo(1)
        }
        
        bottomColorView.snp.remakeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(292)
        }
        
        toLabel.snp.remakeConstraints { make in
            make.top.equalTo(bottomColorView.snp.top).offset(10)
            make.leading.equalTo(view.snp.leading).offset(32)
            make.height.equalTo(20)
            make.width.equalTo(75)
        }
        
        emailField.snp.remakeConstraints { make in
            make.centerY.equalTo(toLabel.snp.centerY)
            make.leading.equalTo(toLabel.snp.trailing).offset(55)
            make.height.equalTo(20)
            make.width.equalTo(220)
        }
        
        sendEmailButton.snp.remakeConstraints { make in
            make.top.equalTo(emailField.snp.bottom).offset(50)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(20)
            make.width.equalTo(95)
        }
        
        cancelButton.snp.remakeConstraints { make in
            make.top.equalTo(sendEmailButton.snp.bottom).offset(24)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(20)
            make.width.equalTo(95)
        }
    }
    
    @objc func sendEmailButtonPressed() {
        
    }
    
    @objc func cancelButtonPressed() {
        
    }
}

extension ShareEmailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return journals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShareEmailCollectionViewCell", for: indexPath) as! ShareEmailCollectionViewCell
        let journal = journals[indexPath.row]
        cell.configure(journalInfoText: journal.title, frameView: UIImage(named: "checkButtonFraim")!, checkImage: UIImage(named: "checkPoint")!)
        return cell
    }
}
