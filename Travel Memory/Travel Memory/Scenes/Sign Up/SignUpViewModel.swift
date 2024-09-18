//
//  SignUpViewModel.swift
//  Travel Memory
//
//  Created by Gio's Mac on 05.09.24.
//

import Foundation

class SignUpViewModel {
    private let authManager = AuthManager.shared
    
    var user = User(fullName: "", email: "", password: "", confirmPassword: "")
    
    // Outputs
    var fullNameAlarmMessage: String?
    var emailAlarmMessage: String?
    var passwordAlarmMessage: String?
    var confirmPasswordAlarmMessage: String?
    
    func didPressSignupButton(
        fullName: String?,
        email: String?,
        password: String?,
        confirmPassword: String?,
        completion: @escaping (Result<Void, SignUpError>) -> Void
    ) {
        // Set user data
        user.fullName = fullName ?? ""
        user.email = email ?? ""
        user.password = password ?? ""
        user.confirmPassword = confirmPassword ?? ""
        
        // Validate fields
        guard validateFullName() else {
            completion(.failure(.fullName))
            return
        }
        guard validateEmail() else {
            completion(.failure(.email))
            return
        }
        guard validatePassword() else {
            completion(.failure(.password))
            return
        }
        guard validateConfirmPassword() else {
            completion(.failure(.confirmPassword))
            return
        }
        
        // If all validations pass, proceed with account creation
        authManager.createAccount(withEmail: user.email, password: user.password, name: user.fullName) { error in
            if let error = error {
                completion(.failure(.auth(error.localizedDescription)))
            } else {
                completion(.success(()))
            }
        }
    }
    
    // Input validation
    func validateFullName() -> Bool {
        if user.fullName.isEmpty {
            fullNameAlarmMessage = "Please enter some text"
            return false
        }
        if !isValidFullName(user.fullName) {
            fullNameAlarmMessage = "Please enter English letters"
            return false
        }
        fullNameAlarmMessage = nil
        return true
    }
    
    func validateEmail() -> Bool {
        if user.email.isEmpty {
            emailAlarmMessage = "Enter email address."
            
            return false
        }
        if !isValidEmail(user.email) {
            emailAlarmMessage = "Please enter a valid email address."
            return false
        }
        emailAlarmMessage = nil
        return true
    }
    
    func validatePassword() -> Bool {
        if user.password.isEmpty {
            passwordAlarmMessage = "Please enter a password."
            return false
        }
        if user.password.count < 6 {
            passwordAlarmMessage = "Password should be more than 5 letters."
            return false
        }
        if !containsCapitalLetter(user.password) {
            passwordAlarmMessage = "Password should include at least one capital letter."
            return false
        }
        if !containsNumber(user.password) {
            passwordAlarmMessage = "Password should include at least one number."
            return false
        }
        passwordAlarmMessage = nil
        return true
    }
    
    func validateConfirmPassword() -> Bool {
        if user.confirmPassword.isEmpty {
            confirmPasswordAlarmMessage = "Please confirm your password."
            return false
        }
        if user.password != user.confirmPassword {
            confirmPasswordAlarmMessage = "Passwords do not match."
            return false
        }
        confirmPasswordAlarmMessage = nil
        return true
    }
    
    // MARK: - Helper Methods
    private func isValidFullName(_ name: String) -> Bool {
        let allowedCharacters = CharacterSet.letters
        let characterSet = CharacterSet(charactersIn: name)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func containsCapitalLetter(_ password: String) -> Bool {
        let capitalLetterRegEx = ".*[A-Z]+.*"
        let capitalLetterTest = NSPredicate(format: "SELF MATCHES %@", capitalLetterRegEx)
        return capitalLetterTest.evaluate(with: password)
    }
    
    private func containsNumber(_ password: String) -> Bool {
        let numberRegEx = ".*[0-9]+.*"
        let numberTest = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        return numberTest.evaluate(with: password)
    }
}

extension SignUpViewModel {
    enum SignUpError: Error {
        case fullName
        case email
        case password
        case confirmPassword
        case auth(String)
        
        var localizedDescription: String {
            switch self {
            case .fullName:
                return "Invalid full name."
            case .email:
                return "Invalid email."
            case .password:
                return "Invalid password."
            case .confirmPassword:
                return "Passwords do not match."
            case .auth(let message):
                return "Authentication error: \(message)"
            }
        }
    }
}
