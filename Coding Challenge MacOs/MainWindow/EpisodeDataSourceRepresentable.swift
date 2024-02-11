//
//  EpisodeDataSourceRepresentable.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

protocol EpisodeDataSourceRepresentable {
    
    func fetchEpisodeList(fromPage page: Int) async -> Result<PagedListResponseDTO<EpisodeDTO>, Failure>
    func fetchSingleEpisode(withId id: Int) async -> Result<EpisodeDTO, Failure>
}
