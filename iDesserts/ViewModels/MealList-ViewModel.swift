//
//  MealList-ViewModel.swift
//  iDesserts
//
//  Created by Andy Wu on 2/15/23.
//

import SwiftUI

extension MealListView {
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var category = MealCategory.dessert
        @Published private(set) var meals = [Meal]()
        
        var urlString: String {
            "https://themealdb.com/api/json/v1/1/filter.php?c=\(category)"
        }
        
        func fetchDesserts() async {
            func handleSuccess(_ mealList: MealCategoryQuery) -> Void {
                self.meals = mealList.meals.sorted()
            }
            
            await fetch(from: urlString, onSuccess: handleSuccess)
        }
        
        func setCategory(category: MealCategory) {
            self.category = category
        }
    }
}
