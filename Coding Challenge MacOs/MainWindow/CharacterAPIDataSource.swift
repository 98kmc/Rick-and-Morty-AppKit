//
//  CharacterAPIDataSource.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

final class CharacterAPIDataSource: CharacterDataSourceRepresentable, APIManager {
    private let baseUrl = Constants.BASE_URL.rawValue
    
    func fetchCharacterList(fromPage page: Int) async -> Result<PagedListResponseDTO<CharacterDTO>, Failure> {
        
        // Build the Url
        guard var urlComponents = URLComponents(string: baseUrl + "character/")
        else { return .failure(Failure.urlConstructError) }
        
        urlComponents.queryItems = [URLQueryItem(name: "page", value: String(page))]
        
        guard let url = urlComponents.url else { return .failure(Failure.urlConstructError) }
        
        // execute the data request
        return await request(for: url)
    }
    
    func fetchSingleCharacter(withId id: Int) async -> Result<CharacterDTO, Failure> {
        
        guard let url = URL(string: baseUrl + "character/\(id)")
        else { return .failure(Failure.urlConstructError) }
        
        return await request(for: url)
    }
}
