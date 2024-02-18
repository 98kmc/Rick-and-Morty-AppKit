//
//  EpisodeRepository.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

final class EpisodeRepository: EpisodeRepositoryRepresentable {
    
    private let service: EpisodeAPIDataSource
    
    init(service: EpisodeAPIDataSource = EpisodeAPIDataSource()) {
        self.service = service
    }
    
    func getEpisodeList(fromPage page: Int) async -> Result<[Episode], Failure> {
        let serviceResponse = await service.fetchEpisodeList(fromPage: page)
        
        switch(serviceResponse) {
        case .success(let response):
            return .success(EpisodeDataMapper.map(response.results))
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func getSingleEpisode(withId id: Int) async -> Result<Episode, Failure> {
        let serviceResponse = await service.fetchSingleEpisode(withId: id)
        
        switch(serviceResponse) {
        case .success(let response):
            return .success(EpisodeDataMapper.convertToEpisode(response))
        case .failure(let error):
            return .failure(error)
        }
    }
}
