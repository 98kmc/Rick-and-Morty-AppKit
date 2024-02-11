//
//  CharacterDataSourceRepresentable.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

protocol CharacterDataSourceRepresentable {
    
    func fetchCharacterList(fromPage page: Int) async -> Result<PagedListResponseDTO<CharacterDTO>, Failure>
    func fetchSingleCharacter(withId id: Int) async -> Result<CharacterDTO, Failure>
}
