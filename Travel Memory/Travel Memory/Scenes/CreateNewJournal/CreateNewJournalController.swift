//
//  CreateNewJournalController.swift
//  Travel Memory
//
//  Created by Gio's Mac on 17.09.24.
//

import UIKit
import SnapKit

class CreateNewJournalController: UIViewController {
    
    //MARK: -UI components
    private lazy var topColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .background
        return view
    }()
    
    private lazy var nameLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 24)
        view.textAlignment = .center
        view.text = "Create new journal"
        return view
    }()
    
    private lazy var sloganLabel: MyLabel = {
        let view = MyLabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textAlignment = .center
        view.text = "Let’s start creating your new travel journal!"
        return view
    }()
    
    private let journalTitle = MyTextFieldView(label: "Journal Title")
    private let destinationField = MyTextFieldView(label: "Destination")
    private let startDateField = MyTextFieldView(label: "Start Date")
    private let endDateField = MyTextFieldView(label: "End Date")
    
    private var startDatePicker = UIDatePicker()
    private var endDatePicker = UIDatePicker()
    
    private lazy var bottomColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .background
        return view
    }()
    
    private lazy var continueButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Continue", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.backgroundColor = .skyBlue
        view.layer.cornerRadius = 8
        view.addTarget(self, action: #selector(pressContinueButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var cancelButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Cancel", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.layer.cornerRadius = 8
        view.addTarget(self, action: #selector(pressCancelButton), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupConstraints()
        configureDatePickers()
        
        view.backgroundColor = .systemBackground
    }
    
    private func setupLayout() {
        view.addSubview(topColorView)
        topColorView.addSubview(nameLabel)
        topColorView.addSubview(sloganLabel)
        view.addSubview(journalTitle)
        view.addSubview(destinationField)
        view.addSubview(startDateField)
        view.addSubview(endDateField)
        view.addSubview(bottomColorView)
        bottomColorView.addSubview(continueButton)
        bottomColorView.addSubview(cancelButton)
    }
    
    private func setupConstraints() {
        topColorView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(292 * Constraint.yCoeff)
        }
        
        nameLabel.snp.remakeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.snp.top).offset(142)
            make.height.equalTo(30)
        }
        
        sloganLabel.snp.remakeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(nameLabel.snp.bottom).offset(90)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(20)
        }
        
        journalTitle.snp.remakeConstraints { make in
            make.top.equalTo(topColorView.snp.bottom).offset(56)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        destinationField.snp.remakeConstraints { make in
            make.top.equalTo(journalTitle.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        startDateField.snp.remakeConstraints { make in
            make.top.equalTo(destinationField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        endDateField.snp.remakeConstraints { make in
            make.top.equalTo(startDateField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        bottomColorView.snp.remakeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(292)
        }
        
        continueButton.snp.remakeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(bottomColorView.snp.top).offset(63)
            make.height.equalTo(27)
            make.width.equalTo(150)
        }
        
        cancelButton.snp.remakeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(36)
            make.bottom.equalTo(view.snp.bottom).offset(-36)
            make.height.equalTo(15)
        }
    }
    
    @objc func pressContinueButton() {
        let journalTitleText = journalTitle.getText()
            let destinationText = destinationField.getText()
            let startDateText = startDateField.getText()
            let endDateText = endDateField.getText()
            
            // Check for empty fields
            if journalTitleText.isEmpty || destinationText.isEmpty || startDateText.isEmpty || endDateText.isEmpty {
                showAlert(title: "Error", message: "All fields must be filled.")
                return
            }

            // Convert the startDateText and endDateText back to Date objects
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium

            guard let startDate = dateFormatter.date(from: startDateText),
                  let endDate = dateFormatter.date(from: endDateText) else {
                showAlert(title: "Error", message: "Invalid date format. Please select valid dates.")
                return
            }
            
            // Validate if the start date is earlier than the end date
            if startDate > endDate {
                showAlert(title: "Error", message: "Start date must be earlier than end date.")
                return
            }

            // Proceed if validation is successful
            let addContentVC = AddContentController()
            addContentVC.journalTitle = journalTitleText
            addContentVC.destination = destinationText
            addContentVC.startDate = startDateText
            addContentVC.endDate = endDateText
            
            // Navigate to AddContentController
            self.navigationController?.pushViewController(addContentVC, animated: true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func pressCancelButton() {
        journalTitle.clearText()
        destinationField.clearText()
        startDateField.clearText()
        endDateField.clearText()
    }
    
    private func configureDatePickers() {
        startDatePicker = UIDatePicker()
        startDatePicker.datePickerMode = .date
        startDatePicker.addTarget(self, action: #selector(startDateChanged(_:)), for: .valueChanged)
        
        endDatePicker = UIDatePicker()
        endDatePicker.datePickerMode = .date
        endDatePicker.addTarget(self, action: #selector(endDateChanged(_:)), for: .valueChanged)
        
        // Set the input views
        startDateField.inputTextField.inputView = startDatePicker
        endDateField.inputTextField.inputView = endDatePicker
        
        // Optionally: Add toolbar to dismiss the picker
        let toolbar = createToolbar()
        startDateField.inputTextField.inputAccessoryView = toolbar
        endDateField.inputTextField.inputAccessoryView = toolbar
    }
    
    private func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissDatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([spaceButton, doneButton], animated: false)
        return toolbar
    }
    
    @objc private func dismissDatePicker() {
        view.endEditing(true)
    }
    
    @objc private func startDateChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        startDateField.text = dateFormatter.string(from: sender.date)
    }
    
    @objc private func endDateChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        endDateField.text = dateFormatter.string(from: sender.date)
    }
}
