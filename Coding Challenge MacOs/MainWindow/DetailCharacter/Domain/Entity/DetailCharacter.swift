//
//  Character.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

struct DetailCharacter: Identifiable {
    
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: String
    let type: String
    let gender: Gender
    let origin: DetailLocation
    let location: DetailLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

extension DetailCharacter: Hashable {
    
    static func == (lhs: DetailCharacter, rhs: DetailCharacter) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
