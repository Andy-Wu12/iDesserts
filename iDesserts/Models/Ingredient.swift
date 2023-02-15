//
//  Ingredient.swift
//  iDesserts
//
//  Created by Andy Wu on 2/15/23.
//

struct Ingredient: Codable, Comparable {
    let name: String
    let quantity: String
    
    static func <(lhs: Ingredient, rhs: Ingredient) -> Bool {
        lhs.name < rhs.name
    }
}
