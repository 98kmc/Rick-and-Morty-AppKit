//
//  CharacterRepository.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

final class CharacterRepository: CharacterRepositoryRepresentable, DetailCharacterRepositoryRepresentable {
    
    private let service: CharacterAPIDataSource
    
    init(service: CharacterAPIDataSource = CharacterAPIDataSource()) {
        self.service = service
    }
    
    func getCharacterList(fromPage page: Int) async -> Result<[Character], Failure> {
        
        let serviceResponse = await service.fetchCharacterList(fromPage: page)
        
        switch(serviceResponse) {
        case .success(let response):
            return .success(CharacterDataMapper.map(response.results))
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func getSingleCharacter(withId id: Int) async -> Result<DetailCharacter, Failure> {
        let serviceResponse = await service.fetchSingleCharacter(withId: id)
        
        switch(serviceResponse) {
        case .success(let response):
            return .success(DetailCharacterDataMapper.convertToCharacter(response))
        case .failure(let error):
            return .failure(error)
        }
    }
}
