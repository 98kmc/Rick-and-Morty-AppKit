//
//  LocationRepositoryRepresentable.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

protocol LocationRepositoryRepresentable {
    
    func getLocationList(fromPage page: Int) async -> Result<[Location], Failure>
    
    func getSingleLocation(withId id: Int) async -> Result<Location, Failure>
}
