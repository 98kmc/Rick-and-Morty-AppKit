//
//  LocationRepository.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

final class LocationRepository: LocationRepositoryRepresentable {

    private let service: LocationAPIDataSource
    
    init(service: LocationAPIDataSource = LocationAPIDataSource()) {
        self.service = service
    }
    
    func getLocationList(fromPage page: Int) async -> Result<[Location], Failure> {
        
        let serviceResponse = await service.fetchLocationList(fromPage: page)
        
        switch(serviceResponse) {
        case .success(let response):
            return .success(LocationDataMapper.map(response.results))
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func getSingleLocation(withId id: Int) async -> Result<Location, Failure> {
        let serviceResponse = await service.fetchSingleLocation(withId: id)
        
        switch(serviceResponse) {
        case .success(let response):
            return .success(LocationDataMapper.convertToLocation(response))
        case .failure(let error):
            return .failure(error)
        }
    }
}
