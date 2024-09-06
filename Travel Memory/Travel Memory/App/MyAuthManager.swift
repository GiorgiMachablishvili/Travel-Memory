//
//  MyAuthManager.swift
//  Travel Memory
//
//  Created by Gio's Mac on 05.09.24.
//

import SwiftUI
import FirebaseAuth

class AuthManager: NSObject, ObservableObject {
    
    //MARK: Properties
    @Published var isUserLoggedIn = false
    
    //MARK: Initialization
    
    override init() {
        super.init()
        setupAuthStateChangeListener()
    }
    
    //MARK: Methods
    
    //MARK: Auth State Change Listener
    private func setupAuthStateChangeListener() {
        Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            guard let self = self else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.isUserLoggedIn = user != nil
            }
            
        }
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

extension AuthManager {
    //MARK: Create Acount
    
    //-Parameters
        //-email
        //-password
        //-name
        //-completion
    
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


