//
//  MealDetail-ViewModel.swift
//  iDesserts
//
//  Created by Andy Wu on 2/15/23.
//

import SwiftUI

extension MealDetailView {
    @MainActor class ViewModel: ObservableObject {
        private var meal: Meal
        
        private var detailsURL: String {
            "https://themealdb.com/api/json/v1/1/lookup.php?i=\(self.meal.id)"
        }
        
        @Published private(set) var instructions: String
        @Published private(set) var ingredients: [Ingredient]
        
        init(meal: Meal) {
            self.meal = meal
            self.instructions = ""
            self.ingredients = [Ingredient]()
        }
        
        func fetchMealDetails() async {
            func handleSuccess(_ items: MealDetailsResponseResult) -> Void {
                if let details = items.meals.first {
                    setInstructions(using: details)
                    setIngredients(using: details)
                }
            }
            
            await fetch(from: detailsURL, onSuccess: handleSuccess)
        }
        
        private func setInstructions(using details: MealDetailsResponse) {
            self.instructions = details.instructions
        }
        
        private func setIngredients(using details: MealDetailsResponse) {
            let ingredMeasurements = [
                Ingredient(name: details.ingredient1, quantity: details.measurement1),
                Ingredient(name: details.ingredient2, quantity: details.measurement2),
                Ingredient(name: details.ingredient3, quantity: details.measurement3),
                Ingredient(name: details.ingredient4, quantity: details.measurement4),
                Ingredient(name: details.ingredient5, quantity: details.measurement5),
                Ingredient(name: details.ingredient6, quantity: details.measurement6),
                Ingredient(name: details.ingredient7, quantity: details.measurement7),
                Ingredient(name: details.ingredient8, quantity: details.measurement8),
                Ingredient(name: details.ingredient9, quantity: details.measurement9),
                Ingredient(name: details.ingredient10, quantity: details.measurement10),
                Ingredient(name: details.ingredient11, quantity: details.measurement11),
                Ingredient(name: details.ingredient12, quantity: details.measurement12),
                Ingredient(name: details.ingredient13, quantity: details.measurement13),
                Ingredient(name: details.ingredient14, quantity: details.measurement14),
                Ingredient(name: details.ingredient15, quantity: details.measurement15),
                Ingredient(name: details.ingredient16 ?? "", quantity: details.measurement16 ?? ""),
                Ingredient(name: details.ingredient17 ?? "", quantity: details.measurement17 ?? ""),
                Ingredient(name: details.ingredient18 ?? "", quantity: details.measurement18 ?? ""),
                Ingredient(name: details.ingredient19 ?? "", quantity: details.measurement19 ?? ""),
                Ingredient(name: details.ingredient20 ?? "", quantity: details.measurement20 ?? ""),
            ]
            
            
            self.ingredients = ingredMeasurements.filter { !($0.name.isTrimmedEmpty() || $0.quantity.isTrimmedEmpty()) }
        }
        
    }
}
