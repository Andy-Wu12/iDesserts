//
//  Meal.swift
//  iDesserts
//
//  Created by Andy Wu on 2/14/23.
//

import Foundation

// https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert
struct Meal: Codable, Comparable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
    
    static func <(lhs: Meal, rhs: Meal) -> Bool {
        lhs.strMeal < rhs.strMeal
    }
}

struct MealCategoryQuery: Codable {
    let meals: [Meal]
    
}
