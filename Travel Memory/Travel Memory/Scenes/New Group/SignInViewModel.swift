//
//  SignInViewModel.swift
//  Travel Memory
//
//  Created by Irakli Kochua on 13.09.24.
//

import Foundation
import FirebaseAuth

class SignInViewModel {
    func pressSignInButton (email:String, password: String, completion: @escaping(Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }
    
            completion(.success(()))
        }
    }
    
}
