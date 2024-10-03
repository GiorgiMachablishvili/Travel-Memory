//
//  ShareEmailViewController.swift
//  Travel Memory
//
//  Created by Gio's Mac on 26.09.24.
//

import UIKit
import SnapKit
import MessageUI

class ShareEmailViewController: UIViewController {
    private let firebaseManager = FireBaseManager.shared
    
    var journals: [Journal] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.bounds.width - 32, height: 44) // Adjust height as needed
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0 // Force single column
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = true
        collectionView.alwaysBounceVertical = true
        collectionView.allowsMultipleSelection = true
        
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
        view.text = "Share with friends".localized()
        return view
    }()
    
    private lazy var sloganLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textAlignment = .center
        view.numberOfLines = 2
        view.text = "Share your travel journal or trip with friends and family.".localized()
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
        view.text = "To: ".localized()
        return view
    }()
    
    private lazy var emailField: UITextField = {
        let view = UITextField(frame: .zero)
        view.backgroundColor = UIColor.skyBlue
        view.placeholder = "type email....".localized()
        view.keyboardType = .emailAddress
        return view
    }()
    
    private lazy var sendEmailButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Send Email".localized(), for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.backgroundColor = .skyBlue
        view.layer.cornerRadius = 2
        view.addTarget(self, action: #selector(sendEmailButtonPressed), for: .touchUpInside)
        return view
    }()
    
    private lazy var cancelButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Cancel".localized(), for: .normal)
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
        fetchUserJournals()
        view.backgroundColor = .systemBackground
        TapGestureManager.hideKeyboardOnTap(view: self.view)
    }
    
    private func setup() {
        view.addSubview(collectionView)
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
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(topColorView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(bottomColorView.snp.top).offset(-16)
        }
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
    
    private func fetchUserJournals(completion: (() -> Void)? = nil) {
        firebaseManager.fetchJournals { [weak self] journals in
            guard let self = self else { return }
            self.journals = journals
            self.collectionView.reloadData()
        }
    }
    
    private func getSelectedTitles() -> [String] {
        return collectionView.indexPathsForSelectedItems?.map { journals[$0.item].title } ?? []
    }
    
    @objc func sendEmailButtonPressed() {
        let selectedTitles = getSelectedTitles()
        
        if selectedTitles.isEmpty {
            AlertUtility.showSimpleAlert(on: self,title: "No Selection", message: "Please select at least one journal to share.")
            return
        }
        
        guard let recipientEmail = emailField.text, !recipientEmail.isEmpty else {
            AlertUtility.showSimpleAlert(on: self, title: "Missing Email", message: "Please enter a recipient email address.")
            return
        }
        
        if MFMailComposeViewController.canSendMail() {
            let mailComposer = MFMailComposeViewController()
            mailComposer.mailComposeDelegate = self
            
            mailComposer.setToRecipients([recipientEmail])
            mailComposer.setSubject("Shared Travel Journals")
            
            let emailBody = "I'd like to share the following travel journals with you:\n\n" +
            selectedTitles.joined(separator: "\n") +
            "\n\nEnjoy!"
            
            mailComposer.setMessageBody(emailBody, isHTML: false)
            
            present(mailComposer, animated: true, completion: nil)
        } else {
            AlertUtility.showSimpleAlert(on: self, title: "Cannot Send Email", message: "Your device is not configured to send emails.")
        }
        
    }
    
    @objc func cancelButtonPressed() {}
}

extension ShareEmailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return journals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShareEmailCollectionViewCell", for: indexPath) as! ShareEmailCollectionViewCell
        let journal = journals[indexPath.row]
        cell.configure(with: journal.title)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 32, height: 44)
    }
}

extension ShareEmailViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true) {
            switch result {
            case .sent:
                AlertUtility.showSimpleAlert(on: self, title: "Success", message: "Email sent successfully.")
            case .failed:
                AlertUtility.showSimpleAlert(on: self, title: "Error", message: "Failed to send email. Please try again.")
            case .cancelled:
                print("Email sending cancelled.")
            case .saved:
                print("Email saved as draft.")
            @unknown default:
                break
            }
        }
    }
}
