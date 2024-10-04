//
//  PickerViewController.swift
//  Travel Memory
//
//  Created by Gio's Mac on 03.10.24.
//

import UIKit
import SnapKit

class PickerViewController: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    private let languageManager = LanguageManage.shared
    
    private lazy var pickerView: UIPickerView = {
        let view = UIPickerView()
        view.delegate = self
        view.dataSource = self
        return view
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPickerView()
        setupBackgroundDim()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPickerView() {
        addSubview(pickerView)

        
        pickerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(150)
        }
    }
    
    private func setupBackgroundDim() {
        backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        let initialSelection = languageManager.languageOptions.firstIndex(of: languageManager.currentLanguage) ?? 0
        pickerView.selectRow(initialSelection, inComponent: 0, animated: false)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        languageManager.languageOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languageManager.languageOptions[row].title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("selected \(languageManager.languageOptions[row])")
        
        let selectedItem = languageManager.languageOptions[row]
        
        languageManager.currentLanguage = selectedItem
    }
}
