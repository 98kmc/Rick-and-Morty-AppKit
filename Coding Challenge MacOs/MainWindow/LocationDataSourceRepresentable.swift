//
//  LocationDataSourceRepresentable.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

protocol LocationDataSourceRepresentable {
    
    func fetchLocationList(fromPage page: Int) async -> Result<PagedListResponseDTO<LocationDTO>, Failure>
    func fetchSingleLocation(withId id: Int) async -> Result<LocationDTO, Failure>
}
