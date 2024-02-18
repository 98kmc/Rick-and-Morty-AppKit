//
//  GetSingleCharacterUseCase.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

final class GetSingleCharacterUseCase {
    
    private let repository: DetailCharacterRepositoryRepresentable
    
    init(repository: DetailCharacterRepositoryRepresentable = CharacterRepository()) {
        self.repository = repository
    }
    
    func invoke(characterId: Int) async -> Result<DetailCharacter, Failure> {
        await repository.getSingleCharacter(withId: characterId)
    }
}
