//
//  GetSingleEpisodeUseCase.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

final class GetSingleEpisodeUseCase {
    
    private let repository: EpisodeRepositoryRepresentable
    
    init(repository: EpisodeRepositoryRepresentable = EpisodeRepository()) {
        self.repository = repository
    }
    
    func invoke(episodeId: Int) async -> Result<Episode, Failure> {
        await repository.getSingleEpisode(withId: episodeId)
    }
}
