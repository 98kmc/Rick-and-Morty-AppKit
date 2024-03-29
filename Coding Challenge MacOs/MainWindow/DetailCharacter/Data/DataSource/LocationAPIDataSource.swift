//
//  LocationAPIDataSource.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

final class LocationAPIDataSource: APIManager {
    
    private let baseUrl = Constants.BASE_URL.rawValue

    func fetchLocationList(fromPage page: Int) async -> Result<PagedListResponseDTO<DetailLocationDTO>, Failure> {
        
        //Build the Url
        guard var urlComponents = URLComponents(string: "\(baseUrl)/location")
        else { return .failure(Failure.urlConstructError) }
        
        urlComponents.queryItems = [URLQueryItem(name: "page", value: String(page))]
        
        guard let url = urlComponents.url else { return .failure(Failure.urlConstructError) }
        
        // execute the data request
        return await request(for: url)
    }
    
    func fetchSingleLocation(withId id: Int) async -> Result<DetailLocationDTO, Failure> {
        
        guard let url = URL(string: baseUrl + "/location/\(id)")
        else { return .failure(Failure.urlConstructError) }
        
        return await request(for: url)
    }
}
