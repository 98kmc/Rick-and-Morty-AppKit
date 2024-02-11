//
//  CharacterDataMapper.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

final class CharacterDataMapper {
    
    static func map(_ data: [CharacterDTO]) -> [Character] {
        data.map { character in
            return Character(
                id: character.id ?? -1,
                name: character.name.orEmpty,
                status: CharacterStatus(rawValue: character.status.orEmpty) ?? .unknown,
                species: character.species.orEmpty,
                type: character.type.orEmpty,
                gender: Gender(rawValue: character.gender.orEmpty) ?? .unknown,
                origin: Location(name: character.origin?.name ?? "", url: character.origin?.url ?? ""),
                location: Location(name: character.location?.name ?? "", url: character.location?.url ?? ""),
                image: character.image.orEmpty,
                episode: character.episode ?? [],
                url: character.url.orEmpty,
                created: character.created.orEmpty)
        }
    }
}
