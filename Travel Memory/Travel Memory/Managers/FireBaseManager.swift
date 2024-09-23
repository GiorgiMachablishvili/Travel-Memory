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
import FirebaseStorage

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
    func uploadJournal(_ journal: Journal, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let user = Auth.auth().currentUser else {
            completion(.failure("Error" as! Error))
            return
        }
        
        fireStore.collection(user.uid).document(journal.id).setData(journal.toDictionary()) { error in
            if let error = error {
                print("Error adding document: \(error)")
                completion(.failure(error))
            } else {
                print("Document added successfully with ID: \(user.uid)")
                completion(.success(()))
            }
        }
    }
}

extension FireBaseManager {
    func uploadImage(_ image: UIImage, path: String, completion: @escaping (Result<URL, Error>) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            completion(.failure(NSError(domain: "ImageUploader", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to convert image to data"])))
            return
        }
        
        let storageRef = Storage.storage().reference()
        let imageRef = storageRef.child(path)
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        imageRef.putData(imageData, metadata: metadata) { (metadata, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            imageRef.downloadURL { (url, error) in
                if let error = error {
                    completion(.failure(error))
                } else if let downloadURL = url {
                    completion(.success(downloadURL))
                } else {
                    completion(.failure(NSError(domain: "ImageUploader", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to get download URL"])))
                }
            }
        }
    }
}
