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
    
    static let example = Meal(strMeal: "Pumpkin Pie",
                              strMealThumb: "https://www.themealdb.com/images/media/meals/usuqtp1511385394.jpg",
                              idMeal: "52857")
}

struct MealCategoryQuery: Codable {
    let meals: [Meal]
    
}
