//
//  GetAllCharactersUseCase.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

final class GetAllCharactersUseCase {
    
    private let repository: CharacterRepositoryRepresentable
    
    init(repository: CharacterRepositoryRepresentable) {
        self.repository = repository
    }
    
    func invoke(page: Int) async -> Result<[Character], Failure> {
        await repository.getCharacterList(fromPage: page)
    }
}
