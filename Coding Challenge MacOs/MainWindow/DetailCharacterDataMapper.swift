//
//  CharacterDetailMapper.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 17/02/2024.
//

import Foundation

final class DetailCharacterDataMapper {
    
    static func map(_ data: [DetailCharacterDTO]) -> [DetailCharacter] {
        data.map { convertToDetailCharacter($0) }
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
