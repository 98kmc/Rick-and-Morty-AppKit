//
//  Character.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 17/02/2024.
//

import Foundation

struct Character: Identifiable {
    let id: Int
    let name: String
    let origin: Location
    let image: String
    let url: String
}

extension Character: Hashable {
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
