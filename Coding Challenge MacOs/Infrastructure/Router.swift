//
//  Router.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

protocol Router: AnyObject {
    associatedtype Route
    func exit()
    func process(route: Route)
}

protocol AppRouter: Router where Route == AppWindow { }
