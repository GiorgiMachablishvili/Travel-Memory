//
//  LanguageManage.swift
//  Travel Memory
//
//  Created by Gio's Mac on 03.10.24.
//

import Foundation

class LanguageManage {
    static let shared = LanguageManage()
    
    private let languageKey = "lang"
    
    let languageOptions: [LanguageType] = [.eng, .geo]
    
    var currentLanguage: LanguageType {
        get {
            if let decodeData = UserDefaults.standard.data(forKey: languageKey) {
                let decoder = JSONDecoder()
                
                if let decodedData = try? decoder.decode(LanguageType.self, from: decodeData) {
                    return decodedData
                    
                } else {
                    return .eng
                }
            }
            else {
                return .eng
            }
        }
        set {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(newValue) {
                UserDefaults.standard.setValue(data, forKey: languageKey)
            }
                
            }
        }
    }


enum LanguageType: Codable {
    case eng
    case geo
    
    var title: String {
        switch self {
        case .eng:
            "English".localized()
        case .geo:
            "Georgian".localized()
        }
    }
    var titleShort: String {
        switch self {
        case .eng:
            "en"
        case .geo:
            "ge"
        }
    }
}
