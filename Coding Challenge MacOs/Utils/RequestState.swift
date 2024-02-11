//
//  RequestState.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

enum RequestState<T> {
    case loading
    case success(data: T)
    case failure(Failure)
}
