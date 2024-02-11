//
//  String+orEmpty.swift
//  Coding Challenge MacOs
//
//  Created by Miguel on 10/02/2024.
//

import Foundation

extension String? {
    
    var orEmpty: String {
        guard let self = self else { return ""}
        return self
    }
}
