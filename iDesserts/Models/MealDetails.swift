//
//  MealDetails.swift
//  iDesserts
//
//  Created by Andy Wu on 2/15/23.
//

import Foundation

struct MealDetails: Comparable {
    private let idMeal: String
    let strMeal: String
    let strInstructions: String
    let ingredients: [Ingredient]
    
    static let example = MealDetails(idMeal: "53005", strMeal: "Strawberry Rhubarb Pie",
                                     strInstructions: "random test instructions\r\n3wretgfthgyjhjkhjgrew", ingredients: [Ingredient(name: "strawberry", quantity: "20 pieces")])
    
    static func <(lhs: MealDetails, rhs: MealDetails) -> Bool {
        lhs.strMeal < rhs.strMeal
    }
}

struct MealDetailsQuery {
    let meals: [MealDetails]
    
}
