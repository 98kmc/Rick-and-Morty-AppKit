//
//  Failure.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

enum Failure: Error {
    case decodingError(Error)
    case urlConstructError
    case APIError(Error)
    case statusCode
}
