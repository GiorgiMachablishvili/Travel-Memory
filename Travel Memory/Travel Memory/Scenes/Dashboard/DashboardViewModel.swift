//
//  DashboardViewModel.swift
//  Travel Memory
//
//  Created by Irakli Kochua on 25.09.24.
//

import Foundation
import FirebaseAuth

class DashboardViewModel {
    private let themeManager = ThemeManager.shared
    
    private(set) var journals: [Journal] = [] {
        didSet {
            journalsUpdated?()
        }
    }
    
    var journalsUpdated: (() -> Void)?
    
    var userName: String {
        if let user = Auth.auth().currentUser {
            return user.displayName ?? "User"
        }
        return "User"
    }
    
    var welcomeMessage: String {
        return "Welcome, \(userName)"
    }
    
    func setJournals(_ journals: [Journal]) {
         self.journals = journals
     }
    
    func addJournal(_ journal: Journal) {
         journals.append(journal)
     }
    
    func logout(completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(.success(()))
        } catch let error {
            completion(.failure(error))
        }
    }
}
