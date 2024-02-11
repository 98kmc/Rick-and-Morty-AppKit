//
//  GetSingleCharacterUseCase.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

final class GetSingleCharacterUseCase {
    
    private let repository: CharacterRepositoryRepresentable
    
    init(repository: CharacterRepositoryRepresentable = CharacterRepository()) {
        self.repository = repository
    }
    
    func invoke(characterId: Int) async -> Result<Character, Failure> {
        await repository.getSingleCharacter(withId: characterId)
    }
}
