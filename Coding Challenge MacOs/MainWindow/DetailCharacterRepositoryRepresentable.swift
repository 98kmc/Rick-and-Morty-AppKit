//
//  DetailCharacterRepositoryRepresentable.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 18/02/2024.
//

import Foundation

protocol DetailCharacterRepositoryRepresentable {
    
    func getSingleCharacter(withId id: Int) async -> Result<DetailCharacter, Failure>
}
