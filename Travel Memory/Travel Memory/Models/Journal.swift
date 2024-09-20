//
//  Journal.swift
//  Travel Memory
//
//  Created by Irakli Kochua on 20.09.24.
//

import Foundation

struct Journal: Codable, Identifiable, Comparable {
    static func < (lhs: Journal, rhs: Journal) -> Bool {
        lhs.dateModified < rhs.dateModified
    }
    
    var id: String
    var title: String
    var destination: String
    var startDate: String
    var endDate: String
    var dateModified: String

    func toDictionary() -> [String: Any] {
        return [
            "id": id,
            "title": title,
            "destination": destination,
            "startDate": startDate,
            "endDate": endDate,
            "dateModified": dateModified,
        ]
    }
}
