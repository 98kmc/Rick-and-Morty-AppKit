//
//  CharacterDTO.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 17/02/2024.
//

import Foundation

struct CharacterDTO: Codable {
    
    let id: Int?
    let name: String?
    let origin: DetailLocationDTO?
    let image: String?
    let url: String?
}
