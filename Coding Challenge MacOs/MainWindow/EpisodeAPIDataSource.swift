//
//  EpisodeAPIDataSource.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

final class EpisodeAPIDataSource: APIManager {
    
    private let baseUrl = Constants.BASE_URL.rawValue

    func fetchEpisodeList(fromPage page: Int) async -> Result<PagedListResponseDTO<EpisodeDTO>, Failure> {
        
        //Build the Url
        guard var urlComponents = URLComponents(string: "\(baseUrl)/episode")
        else { return .failure(Failure.urlConstructError) }
        
        urlComponents.queryItems = [URLQueryItem(name: "page", value: String(page))]
        
        guard let url = urlComponents.url else { return .failure(Failure.urlConstructError) }
        
        // execute the data request
        return await request(for: url)
    }
    
    func fetchSingleEpisode(withId id: Int) async -> Result<EpisodeDTO, Failure> {
        
        guard let url = URL(string: baseUrl + "/episode/\(id)")
        else { return .failure(Failure.urlConstructError) }
        
        return await request(for: url)
    }
}
