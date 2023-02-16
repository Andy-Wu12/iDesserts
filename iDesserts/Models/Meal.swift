//
//  Meal.swift
//  iDesserts
//
//  Created by Andy Wu on 2/14/23.
//

import Foundation

// https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert
struct Meal: Codable, Comparable {
    let name: String
    let thumbnailURL: String?
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case thumbnailURL = "strMealThumb"
        case id = "idMeal"
    }
    
    static func <(lhs: Meal, rhs: Meal) -> Bool {
        lhs.name < rhs.name
    }
    
    static let example = Meal(name: "Pumpkin Pie",
                              thumbnailURL: "https://www.themealdb.com/images/media/meals/usuqtp1511385394.jpg",
                              id: "52857")
}

struct MealCategoryQuery: Codable {
    let meals: [Meal]
    
}

enum MealCategory: String, CaseIterable {
    case beef = "Beef"
    case breakfast = "Breakfast"
    case chicken = "Chicken"
    case dessert = "Dessert"
    case goat = "Goat"
    case lamb = "Lamb"
    case miscellaneous = "Miscellaneous" // Has instance of null strMealThub
    case pasta = "Pasta"
    case pork = "Pork"
    case seafood = "Seafood"
    case side = "Side"
    case starter = "Starter"
    case vegan = "Vegan"
    case vegetarian = "Vegetarian"
}
