//
//  JournalDetailsViewController.swift
//  Travel Memory
//
//  Created by Irakli Kochua on 27.09.24.
//

import UIKit

class JournalDetailsViewController: UIViewController {
    var selectedJournal: Journal
    
    init(selectedJournal: Journal) {
        self.selectedJournal = selectedJournal
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("selectedJournal", selectedJournal.title)

    }
    
    
}
