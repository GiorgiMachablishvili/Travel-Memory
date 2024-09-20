//
//  AddContentController.swift
//  Travel Memory
//
//  Created by Gio's Mac on 17.09.24.
//

import UIKit
import SnapKit

class AddContentController: UIViewController {
    
    var journalTitle: String?
    var destination: String?
    var startDate: String?
    var endDate: String?
    
    //MARK: -UI components
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 128, height: 328)
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
        
        collectionView.register(AddContentCollectionViewCell.self, forCellWithReuseIdentifier: "AddContentCollectionViewCell")
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
        view.text = "Add Content to Your Journal"
        return view
    }()
    
    private lazy var sloganLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textAlignment = .center
        view.numberOfLines = 2
        view.text = "You can start adding memories and content to your journal, Let’s begin!"
        return view
    }()
    
    private lazy var lineImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "LineImage")
        return view
    }()
    
    private lazy var addPhotoLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textAlignment = .left
        view.text = "Add Photo"
        return view
    }()
    
    private lazy var addPhotoButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Browse:", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.backgroundColor = .skyBlue
        view.layer.cornerRadius = 8
        view.addTarget(self, action: #selector(pressAddPhotoBrowserButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var addVideoLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textAlignment = .left
        view.text = "Add Video"
        return view
    }()
    
    private lazy var addVideoButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Browse:", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.backgroundColor = .skyBlue
        view.layer.cornerRadius = 8
        view.addTarget(self, action: #selector(pressAddVideoBrowserButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var addNoteLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.textAlignment = .left
        view.text = "Add Note :"
        return view
    }()
    
    private lazy var noteTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 11)
        view.backgroundColor = UIColor.init(hexString: "CDE3FC")
        view.placeholder = "Type here...."
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var bottomColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .background
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupConstraints()
        
        view.backgroundColor = .systemBackground
        
        setJournalInfo()
    }
    
    private func setupLayout() {
        view.addSubview(topColorView)
        topColorView.addSubview(nameLabel)
        topColorView.addSubview(sloganLabel)
        view.addSubview(lineImageView)
        view.addSubview(addPhotoLabel)
        view.addSubview(addPhotoButton)
        view.addSubview(addVideoLabel)
        view.addSubview(addVideoButton)
        view.addSubview(bottomColorView)
        view.addSubview(collectionView)
        bottomColorView.addSubview(addNoteLabel)
        bottomColorView.addSubview(noteTextField)
    }
    
    private func setupConstraints() {
        topColorView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(292 * Constraint.yCoeff)
        }
        
        nameLabel.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(141)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(36)
        }
        
        sloganLabel.snp.remakeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(39)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(38)
        }
        
        collectionView.snp.remakeConstraints { make in
            make.top.equalTo(topColorView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(140)
        }
        
        lineImageView.snp.remakeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(2)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(1)
        }
        
        addPhotoLabel.snp.remakeConstraints { make in
            make.top.equalTo(lineImageView.snp.bottom).offset(30)
            make.leading.equalTo(view.snp.leading).offset(37)
            make.height.equalTo(20)
        }
        
        addPhotoButton.snp.remakeConstraints { make in
            make.centerX.equalTo(addPhotoLabel.snp.centerX)
            make.height.equalTo(26)
            make.width.equalTo(96)
        }
        
        addVideoLabel.snp.remakeConstraints { make in
            make.top.equalTo(addPhotoLabel.snp.bottom).offset(5)
            make.leading.equalTo(view.snp.leading).offset(37)
            make.height.equalTo(20)
        }
        
        addVideoButton.snp.remakeConstraints { make in
            make.centerX.equalTo(addVideoLabel.snp.centerX)
            make.height.equalTo(26)
            make.width.equalTo(96)
        }
        
        addNoteLabel.snp.remakeConstraints { make in
            make.top.equalTo(bottomColorView.snp.top).offset(5)
            make.leading.equalTo(view.snp.leading).offset(37)
            make.height.equalTo(20)
        }
        
        noteTextField.snp.remakeConstraints { make in
            make.top.equalTo(bottomColorView.snp.top).offset(5)
            make.leading.equalTo(addNoteLabel.snp.trailing).offset(35)
            make.height.equalTo(139)
            make.width.equalTo(199)
        }
        
        bottomColorView.snp.remakeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(292)
        }
    }
    
    private func setJournalInfo() {
            print("Journal Title: \(journalTitle ?? "")")
            print("Destination: \(destination ?? "")")
            print("Start Date: \(startDate ?? "")")
            print("End Date: \(endDate ?? "")")
        }
    
    @objc func pressAddPhotoBrowserButton() {
        
    }
    
    @objc func pressAddVideoBrowserButton() {
        
    }
}


extension AddContentController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddContentCollectionViewCell", for: indexPath) as! AddContentCollectionViewCell
        cell.setJournalInfo(journalTitle: journalTitle ?? "", destination: destination ?? "", startDate: startDate ?? "", endDate: endDate ?? "")
        return cell
    }
}
