//
//  LaunchViewController.swift
//  Travel Memory
//
//  Created by Irakli Kochua on 03.09.24.
//

import UIKit
import SnapKit

class LaunchViewController: UIViewController {
    private lazy var logoView: LogoView = {
        let view = LogoView()
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        
        setup()
        layout()
    }
    private func setup() {
        view.addSubview(logoView)
    }
    
    private func layout() {
        logoView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
}
