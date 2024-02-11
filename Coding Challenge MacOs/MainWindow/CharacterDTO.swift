//
//  CharacterDTO.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

struct CharacterDTO: Codable {
    
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: LocationDTO?
    let location: LocationDTO?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

/*
 {
     "id": 361,
     "name": "Toxic Rick",
     "status": "Dead",
     "species": "Humanoid",
     "type": "Rick's Toxic Side",
     "gender": "Male",
     "origin": {
     "name": "Alien Spa",
     "url": "https://rickandmortyapi.com/api/location/64"
     },
     "location": {
     "name": "Earth",
     "url": "https://rickandmortyapi.com/api/location/20"
     },
     "image": "https://rickandmortyapi.com/api/character/avatar/361.jpeg",
     "episode": [
     "https://rickandmortyapi.com/api/episode/27"
     ],
     "url": "https://rickandmortyapi.com/api/character/361",
     "created": "2018-01-10T18:20:41.703Z"
 },
 */
