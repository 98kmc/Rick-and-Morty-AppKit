//
//  Location.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

struct DetailLocation {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
    
    init(id: Int, name: String, type: String, dimension: String, residents: [String], url: String, created: String) {
        self.id = id
        self.name = name
        self.type = type
        self.dimension = dimension
        self.residents = residents
        self.url = url
        self.created = created
    }
    
    init(name: String = "", url: String = "" ) {
        self.id = -1
        self.name = ""
        self.type = ""
        self.dimension = ""
        self.residents = []
        self.url = url
        self.created = ""
    }
}
