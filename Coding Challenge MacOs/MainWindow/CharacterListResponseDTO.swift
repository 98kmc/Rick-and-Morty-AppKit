//
//  CharacterListResponseDTO.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

struct CharacterListResponseInfoDTO : Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}

struct CharacterListResponseDTO : Codable {
    let info: CharacterListResponseInfoDTO
    let results: [CharacterDTO]
}

/*
 {
   "info": {
     "count": 826,
     "pages": 42,
     "next": "https://rickandmortyapi.com/api/character/?page=2",
     "prev": null
   },
   "results": [
     // ...
   ]
 }
 */
