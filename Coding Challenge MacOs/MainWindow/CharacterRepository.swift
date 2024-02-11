//
//  CharacterRepository.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

final class CharacterRepository: CharacterRepositoryRepresentable {
    
    private let service = APICharacterDataSource()
    
    func getCharacterList(fromPage page: Int) async -> Result<[Character], Failure> {
        
        let serviceResponse = await service.fetchCharactersList(fromPage: page)
        
        switch(serviceResponse) {
        case .success(let response):
            return .success(CharacterDataMapper.map(response.results))
        case .failure(let error):
            return .failure(error)
        }
    }
}
