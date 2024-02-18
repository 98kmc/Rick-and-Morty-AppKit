//
//  GetSingleLocationUseCase.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

final class GetSingleLocationUseCase {
    
    private let repository: LocationRepositoryRepresentable
    
    init(repository: LocationRepositoryRepresentable = LocationRepository()) {
        self.repository = repository
    }
    
    func invoke(locationId: Int) async -> Result<DetailLocation, Failure> {
        await repository.getSingleLocation(withId: locationId)
    }
}

