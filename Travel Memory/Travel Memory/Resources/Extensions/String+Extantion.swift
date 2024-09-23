//
//  String+Extantion.swift
//  Travel Memory
//
//  Created by Irakli Kochua on 23.09.24.
//

import Foundation

extension String {
    func limitedTo(_ limit: Int) -> String {
        if self.count <= limit {
            return self
        }
        return String(self.prefix(limit - 3)) + "..."
    }
}
