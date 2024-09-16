//
//  SignInViewModel.swift
//  Travel Memory
//
//  Created by Irakli Kochua on 13.09.24.
//

import Foundation
import FirebaseAuth

class SignInViewModel {
    func pressSignInButton (email:String, password: String, completion: @escaping(Result<Void, SignInError>) -> Void) {
        guard validateEmail(email) else {
            completion(.failure(.email))
            return
        }
        guard validatePassword(password) else {
            completion(.failure(.password))
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(.auth(error.localizedDescription)))
                return
            }
            
            completion(.success(()))
        }
    }
    
    func validateEmail(_ email: String) -> Bool {
        if email.isEmpty {
            return false
        }
        if !isValidEmail(email) {
            return false
        }
        return true
    }
    
    func validatePassword(_ password: String) -> Bool {
        if  password.isEmpty {
            return false
        }
        if password.count < 6 {
            return false
        }
        return true
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

extension SignInViewModel {
    enum SignInError: Error {
        case email
        case password
        case auth(String)
        
        var localizedDescription: String {
            switch self {
            case .email:
                return "Invalid email."
            case .password:
                return "Invalid password."
            case .auth(let message):
                return "Authentication error: \(message)"
            }
        }
    }
}
