//
//  MyAuthManager.swift
//  Travel Memory
//
//  Created by Gio's Mac on 05.09.24.
//

import SwiftUI
import FirebaseAuth

class FireBaseManager {
    static let shared = FireBaseManager()
    
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


