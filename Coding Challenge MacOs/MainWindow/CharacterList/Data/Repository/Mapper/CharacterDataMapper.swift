//
//  CharacterDataMapper.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

final class CharacterDataMapper {
    
    static func map(_ data: [DetailCharacterDTO]) -> [DetailCharacter] {
        data.map { convertToDetailCharacter($0) }
    }
    
    static func map(_ data: [CharacterDTO]) -> [Character] {
        data.map { convertToCharacter($0) }
    }
    
    static func convertToCharacter(_ character: CharacterDTO) -> Character {
        return Character(
            id: character.id ?? -1,
            name: character.name.orEmpty,
            origin: Location(name: character.origin?.name ?? ""),
            image: character.image.orEmpty,
            url: character.url.orEmpty)
    }
    
    static func convertToDetailCharacter(_ character: DetailCharacterDTO) -> DetailCharacter {
        return DetailCharacter(
            id: character.id ?? -1,
            name: character.name.orEmpty,
            status: CharacterStatus(rawValue: character.status.orEmpty) ?? .unknown,
            species: character.species.orEmpty,
            type: character.type.orEmpty,
            gender: Gender(rawValue: character.gender.orEmpty) ?? .unknown,
            origin: DetailLocation(name: character.origin?.name ?? "", url: character.origin?.url ?? ""),
            location: DetailLocation(name: character.location?.name ?? "", url: character.location?.url ?? ""),
            image: character.image.orEmpty,
            episode: character.episode ?? [],
            url: character.url.orEmpty,
            created: character.created.orEmpty)
    }
}
