//
//  EpisodeDTO.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

struct EpisodeDTO: Codable {
    let id: Int?
    let name: String?
    let air_date: String?
    let episode: String?
    let characters: [String]?
    let url: String?
    let created: String?
}

/*
 {
   "id": 28,
   "name": "The Ricklantis Mixup",
   "air_date": "September 10, 2017",
   "episode": "S03E07",
   "characters": [
     "https://rickandmortyapi.com/api/character/1",
     "https://rickandmortyapi.com/api/character/2",
     // ...
   ],
   "url": "https://rickandmortyapi.com/api/episode/28",
   "created": "2017-11-10T12:56:36.618Z"
 }
 */
