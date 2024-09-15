//
//  DashboardViewController.swift
//  Travel Memory
//
//  Created by Gio's Mac on 15.09.24.
//

import UIKit
import SnapKit

class DashboardViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 160)
        layout.minimumLineSpacing = 15
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(DashboardCell.self, forCellWithReuseIdentifier: "DashboardCell")
        return collectionView
    }()
    
    private let journalData: [(image: UIImage, title: String)] = [
        (image: UIImage(named: "japan")!, title: "1. Sushi in Japan"),
        (image: UIImage(named: "ny")!, title: "2. NY never sleep"),
        (image: UIImage(named: "new mexico")!, title: "3. Chili day New Mexico")
    ]
    
    private lazy var topColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.init(hexString: "0371F2").withAlphaComponent(25)
        return view
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 14)
        view.textColor = UIColor.init(hexString: "000000")
        view.textAlignment = .center
        
        if let user = Auth.auth().currentUser {
               let userName = user.displayName ?? "User"
               view.text = "Welcome, \(userName)"
           } else {
               view.text = "Welcome"
           }
        return view
    }()
    
    private lazy var dashboardInfoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textColor = UIColor.init(hexString: "000000")
        view.textAlignment = .center
        view.numberOfLines = 3
        view.text = "This is your dashboard where you can start creating and managing your travel journals."
        return view
    }()
    
    private lazy var lineImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "LineImage")
        return view
    }()
    
    private lazy var journalLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textColor = UIColor.init(hexString: "000000")
        view.textAlignment = .center
        view.text = "Your Journals:"
        return view
    }()
    
    private lazy var bottomColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.init(hexString: "0371F2")
        return view
    }()
    
    private lazy var lineBottomImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "LineImage")
        return view
    }()
    
    private lazy var bottomButtonView: DashboardBottomButtonView = {
        let view = DashboardBottomButtonView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
        
        view.backgroundColor = .systemBackground
    }
    
    
    private func setup() {
        view.addSubview(topColorView)
        topColorView.addSubview(welcomeLabel)
        topColorView.addSubview(dashboardInfoLabel)
        topColorView.addSubview(lineImageView)
        topColorView.addSubview(journalLabel)
        view.addSubview(bottomColorView)
        view.addSubview(collectionView)
        bottomColorView.addSubview(lineBottomImageView)
        bottomColorView.addSubview(bottomButtonView)
    }
    
    private func setupConstraints() {
        topColorView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(292 * Constraint.yCoeff)
        }
        
        welcomeLabel.snp.remakeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.snp.top).offset(106)
            make.height.equalTo(18)
        }
        
        dashboardInfoLabel.snp.remakeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(welcomeLabel.snp.bottom).offset(29)
            make.leading.trailing.equalToSuperview().inset(35)
            make.height.equalTo(50)
        }
        
        lineImageView.snp.remakeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(dashboardInfoLabel.snp.bottom).offset(26)
            make.width.equalTo(317)
            make.height.equalTo(1)
        }
        
        journalLabel.snp.remakeConstraints { make in
            make.top.equalTo(lineImageView.snp.bottom).offset(25)
            make.leading.equalTo(view.snp.leading).offset(40)
            make.height.equalTo(15)
            make.width.equalTo(120)
        }
        
        collectionView.snp.remakeConstraints { make in
            make.top.equalTo(topColorView.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(bottomColorView.snp.top).offset(-5)
        }
        bottomColorView.snp.remakeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(292)
        }
        
        lineBottomImageView.snp.remakeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(view.snp.bottom).offset(-95)
            make.width.equalTo(317)
            make.height.equalTo(1)
        }
        
        bottomButtonView.snp.remakeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom).offset(-14)
            make.height.equalTo(70)
        }
    }
}

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return journalData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardCell", for: indexPath) as! DashboardCell
        let journal = journalData[indexPath.row]
        cell.configure(title: journal.title, image: journal.image)
        return cell
    }
    
}
