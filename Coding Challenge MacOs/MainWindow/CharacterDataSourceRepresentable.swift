//
//  CharacterDataSourceRepresentable.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

protocol CharacterDataSourceRepresentable {
    
    func fetchCharactersList(fromPage page: Int) async -> Result<CharacterListResponseDTO, Failure>
    func fetchSingleCharacter() async -> Result<CharacterDTO, Failure>
}
