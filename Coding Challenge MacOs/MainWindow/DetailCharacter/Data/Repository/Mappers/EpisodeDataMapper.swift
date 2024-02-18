//
//  EpisodeDataMapper.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

final class EpisodeDataMapper {
    
    static func map(_ data: [EpisodeDTO]) -> [Episode] {
        data.map { convertToEpisode($0) }
    }
    
    static func convertToEpisode(_ episode: EpisodeDTO) -> Episode {
        return Episode(
            id: episode.id ?? -1,
            name: episode.name.orEmpty,
            airDate: episode.air_date.orEmpty,
            episode: episode.episode.orEmpty,
            characters: episode.characters ?? [],
            url: episode.url.orEmpty,
            created: episode.created.orEmpty)
    }
}
