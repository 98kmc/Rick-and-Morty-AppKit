//
//  GetAllLocationsUseCase.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

final class GetAllLocationsUseCase {
    
    private let repository: LocationRepositoryRepresentable
    
    init(repository: LocationRepositoryRepresentable = LocationRepository()) {
        self.repository = repository
    }
    
    func invoke(page: Int) async -> Result<[DetailLocation], Failure> {
        await repository.getLocationList(fromPage: page)
    }
}
