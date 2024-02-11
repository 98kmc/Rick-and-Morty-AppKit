//
//  EpisodeRepositoryRepresentable.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

protocol EpisodeRepositoryRepresentable {
    
    func getEpisodeList(fromPage page: Int) async -> Result<[Episode], Failure>
    
    func getSingleEpisode(withId id: Int) async -> Result<Episode, Failure>
}
