//
//  MyAuthManager.swift
//  Travel Memory
//
//  Created by Gio's Mac on 05.09.24.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import FirebaseDatabaseInternal

class FireBaseManager {
    static let shared = FireBaseManager()
    private let fireStore = Firestore.firestore()
    
    
    //MARK: Init
    private init() {}
    
    //MARK: Methods
    func isUserLoggedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
    //MARK: Sign Out
    func signOut(completion: @escaping (Error?) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(nil)
        } catch let signOutError as NSError {
            completion(signOutError)
        }
    }
    
}

//MARK: Account creation and sign in

extension FireBaseManager {
    //MARK: Create Acount
    
    /// Creat account
    /// - Parameters:
    ///   - email: email description
    ///   - password: password description
    ///   - name: name description
    ///   - completion: completion description
    /// - Example:
    /// ```
    /// authManager.createAccount(withEmail: user.email, password: user.password, name: user.fullName) { error in
    /// if let error = error {
    /// completion(.failure(.auth(error.localizedDescription)))
    /// } else {
    /// completion(.success(()))
    /// }
    ///
    func createAccount(withEmail email: String, password: String, name: String, completion: @escaping(Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(error)
            } else if let user = authResult?.user {
                let changeRequest = user.createProfileChangeRequest()
                changeRequest.displayName = name
                changeRequest.commitChanges { error in
                    completion(error)
                }
            } else {
                completion(nil)
            }
        }
    }
    
    //MARK: Sign In With Email and Password
    
    //-Parameters
    //-email
    //-password
    //-name
    //-completion
    
    func signInWithEmail(withEmail email: String, password: String, name: String, completion: @escaping(Error?, String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(error, nil)
            } else if let user = authResult?.user {
                let useName = user.displayName
                completion(error, nil)
            } else {
                completion(nil, nil)
            }
        }
    }
}

extension FireBaseManager {
    func fetchJournalTitles(completion: @escaping ([String]) -> Void) {
        fireStore.collection("journals").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching journals: \(error.localizedDescription)")
                completion([]) // Return empty array if error
            } else {
                var journalTitles: [String] = []
                for document in querySnapshot!.documents {
                    let data = document.data()
                    if let title = data["title"] as? String {
                        journalTitles.append(title)
                    }
                }
                completion(journalTitles)
            }
        }
    }
}


// MARK: Firestore
extension FireBaseManager {
    func uploadJournal(_ journal: Journal, completion: @escaping (Bool) -> Void) {
        let journalData: [String: Any] = [
            "title": journal.title,
            "destination": journal.destination,
            "startDate": journal.startDate,
            "endDate": journal.endDate,
            "dateModified": journal.dateModified
        ]
        
        // Assuming journals are stored in a collection called "journals"
        fireStore.collection("journals").document(journal.id).setData(journalData) { error in
            if let error = error {
                print("Error uploading journal: \(error.localizedDescription)")
                completion(false)
            } else {
                completion(true)
            }
        }
    }
}

