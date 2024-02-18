//
//  ImageLoader.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 17/02/2024.
//

import AppKit

protocol ImageLoader: AnyObject { }

extension ImageLoader {
    
    @MainActor
    func fetchImage(imageURL: String) async throws -> NSImage {
        
        guard let url = URL(string: imageURL) else { throw Failure.urlConstructError }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
              let image = NSImage(data: data), 200...299 ~= statusCode
        else { throw Failure.statusCode }
        return image
    }
}
