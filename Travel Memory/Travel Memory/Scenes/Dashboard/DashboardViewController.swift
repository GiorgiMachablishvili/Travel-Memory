//
//  DashboardViewController.swift
//  Travel Memory
//
//  Created by Gio's Mac on 15.09.24.
//

import UIKit
import SnapKit
import FirebaseAuth
import FirebaseFirestore

protocol DashboardBottomButtonViewDelegate: AnyObject {
    func didPressCreateFolderButton()
    func didPressAddFolderButton()
    func didPressShareButton()
    func didPressLogoutButton()
}

class DashboardViewController: UIViewController, DashboardBottomButtonViewDelegate, DashboardCellDelegate {
    
    private let themeManager = ThemeManager.shared
    private let refreshControl = UIRefreshControl()
    private var isDeleteButtonActive = false
    private var selectedJournalTitle: String?
    
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
        collectionView.refreshControl = refreshControl
        return collectionView
    }()
    
    var journals: [Journal] = []
    var journalTitles: [String] {
        journals.map { $0.title }
    }
    
    private lazy var topColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(named: "backgroundPrimary")
        return view
    }()
    
    private lazy var menuMoreImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "Menu")
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didPressMore))
        view.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    private lazy var welcomeLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 14)
        view.textAlignment = .center
        
        if let user = Auth.auth().currentUser {
            let userName = user.displayName ?? "User"
            view.text = "Welcome, \(userName)"
        } else {
            view.text = "Welcome"
        }
        return view
    }()
    
    private lazy var dashboardInfoLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
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
    
    private lazy var journalLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textAlignment = .center
        view.text = "Your Journals:"
        return view
    }()
    
    private lazy var bottomColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(named: "backgroundPrimary")
        return view
    }()
    
    private lazy var lineBottomImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "LineImage")
        return view
    }()
    
    private lazy var bottomButtonView: DashboardBottomButtonView = {
        let view = DashboardBottomButtonView()
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
        
        view.backgroundColor = .background
        navigationItem.hidesBackButton = true
        
        fetchUserJournals()
        
        refreshControl.addTarget(self, action: #selector(refreshJournals), for: .valueChanged)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchUserJournals()
    }
    
    private func setup() {
        view.addSubview(topColorView)
        view.addSubview(menuMoreImage)
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
        
        menuMoreImage.snp.remakeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            make.left.equalTo(view.snp.left).offset(20)
            make.height.width.equalTo(24)
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
    
    func didPressCreateFolderButton() {
        let createController = CreateNewJournalController()
        self.navigationController?.pushViewController(createController, animated: true)
    }
    
    func didPressAddFolderButton() {
        isDeleteButtonActive.toggle()
        collectionView.reloadData()
    }
    
    func didPressDeleteButton(at indexPath: IndexPath) {
        let journalToDelete = journals[indexPath.item]
        let db = Firestore.firestore()
        let documentID = journalToDelete.id
        
        guard let currentUserID = Auth.auth().currentUser?.uid else {
            print("Error: No user is logged in")
            return
        }
        
        let journalPath = db.collection("users").document(currentUserID).collection("journals").document(documentID)
        journalPath.delete { [weak self] error in
            if let error = error {
                print("Error removing document: \(error)")
            } else {
                self?.journals.remove(at: indexPath.item)
                self?.collectionView.deleteItems(at: [indexPath])
            }
        }
        
    }
    
    func didPressShareButton() {
        let shareEmailVC = ShareEmailViewController()
        shareEmailVC.journals = journals
        self.navigationController?.pushViewController(shareEmailVC, animated: true)
    }
    
    func didPressLogoutButton() {
        do {
            try Auth.auth().signOut()
            navigateToSignInController()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    @objc func didPressMore() {
        navigationController?.pushViewController(MoreViewController(), animated: true)
    }
    
    func navigateToSignInController() {
        let signInController = SignInController()
        let navigationController = UINavigationController(rootViewController: signInController)
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.rootViewController = navigationController
    }
    
    private func fetchUserJournals(completion: (() -> Void)? = nil) {
        FireBaseManager.shared.fetchJournals { [weak self] journals in
            guard let self = self else { return }
            //            self.journals = journals
            //            self.collectionView.reloadData()
            //            completion?()
            self.journals = journals.map { journal in
                return Journal(
                    id: journal.id,
                    title: journal.title,
                    destination: journal.destination,
                    startDate: journal.startDate,
                    endDate: journal.endDate,
                    dateModified: journal.dateModified,
                    imageUrl: journal.imageUrl,
                    note: journal.note
                )
            }
            self.collectionView.reloadData()
            completion?()
        }
    }
    
    @objc private func refreshJournals() {
        fetchUserJournals { [weak self] in
            self?.refreshControl.endRefreshing()
        }
    }
}

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return journals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardCell", for: indexPath) as! DashboardCell
        let journal = journals[indexPath.item]
        cell.configure(title: journal.title, imageUrl: journal.imageUrl, indexPath: indexPath)
        cell.setDeleteButtonVisibility(isVisible: isDeleteButtonActive)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let journal = journals[indexPath.item]
        let JournalDetailsVC = JournalDetailsViewController(selectedJournal: journal)
        self.navigationController?.pushViewController(JournalDetailsVC, animated: true)
    }
}
