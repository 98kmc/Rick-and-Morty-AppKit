//
//  APIManager.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Combine
import AppKit

protocol APIManager: AnyObject { }

extension APIManager {
    
    func request<T>(for url: URL) async -> Result<T, Failure> where T : Codable {
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let serverResponse = try decoder.decode(T.self, from: data)
            
            return .success(serverResponse)
            
        } catch let error as DecodingError {
            
            return .failure(Failure.decodingError(error))
        } catch {
            
            return .failure(Failure.APIError(error))
        }
    }
    
    static func fetchImage(imageURL: String) async throws -> NSImage {
        guard let url = URL(string: imageURL) else { throw Failure.urlConstructError }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
                  let image = NSImage(data: data), 200...299 ~= statusCode else { throw Failure.statusCode }
            return image
        } catch {
            throw error
        }
    }
}
