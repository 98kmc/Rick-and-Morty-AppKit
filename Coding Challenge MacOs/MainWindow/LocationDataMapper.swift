//
//  LocationDataMapper.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

final class LocationDataMapper {
    
    static func map(_ data: [LocationDTO]) -> [Location] {
        data.map { convertToLocation($0) }
    }
    
    static func convertToLocation(_ location: LocationDTO) -> Location {
        return Location(
            id: location.id ?? -1,
            name: location.name.orEmpty,
            type: location.type.orEmpty,
            dimension: location.dimension.orEmpty,
            residents: location.residents ?? [],
            url: location.url.orEmpty,
            created: location.created.orEmpty)
    }
}
