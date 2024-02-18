//
//  CharacterRepositoryRepresentable.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

protocol CharacterRepositoryRepresentable {
    
    func getCharacterList(fromPage page: Int) async -> Result<[Character], Failure> 
    
  //  func getSingleCharacter(withId id: Int) async -> Result<Character, Failure>
}
