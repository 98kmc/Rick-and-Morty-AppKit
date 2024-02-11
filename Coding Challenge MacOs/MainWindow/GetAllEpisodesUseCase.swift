//
//  GetAllEpisodesUseCase.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

final class GetAllEpisodesUseCase {
    
    private let repository: EpisodeRepositoryRepresentable
    
    init(repository: EpisodeRepositoryRepresentable = EpisodeRepository()) {
        self.repository = repository
    }
    
    func invoke(page: Int) async -> Result<[Episode], Failure> {
        await repository.getEpisodeList(fromPage: page)
    }
}
