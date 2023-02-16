//
//  MealList-ViewModel.swift
//  iDesserts
//
//  Created by Andy Wu on 2/15/23.
//

import SwiftUI

extension MealListView {
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var meals = [Meal]()
        
        let urlString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        func fetchDesserts() async {
            func handleSuccess(_ mealList: MealCategoryQuery) -> Void {
                self.meals = mealList.meals.sorted()
            }
            
            await fetch(from: urlString, onSuccess: handleSuccess)
        }
    }
}
