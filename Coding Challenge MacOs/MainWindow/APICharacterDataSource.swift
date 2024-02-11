//
//  APICharacterDataSource.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

final class APICharacterDataSource: CharacterDataSourceRepresentable, APIManager {
    
    private let baseUrl = Constants.BASE_URL.rawValue
    
    func fetchCharactersList(fromPage page: Int) async -> Result<CharacterListResponseDTO, Failure> {
        
        // Build the Url
        guard var urlComponents = URLComponents(string: "\(baseUrl)/character")
        else { return .failure(Failure.urlConstructError) }
        
        urlComponents.queryItems = [URLQueryItem(name: "page", value: String(page))]
        
        guard let url = urlComponents.url else { return .failure(Failure.urlConstructError) }
        
        // execute the data request
        return await request(for: url)
    }
    
    func fetchSingleCharacter() async -> Result<CharacterDTO, Failure> {
        .failure(.statusCode)
    }
}
