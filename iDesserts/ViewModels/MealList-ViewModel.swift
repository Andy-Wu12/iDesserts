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
        
        // TODO: A significant improvement would be to make this more generic in both urlString and decoded type
        func fetchDesserts() async {
            let urlString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
            
            guard let url = URL(string: urlString) else {
                print("Invalid URL: \(urlString)")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let items = try JSONDecoder().decode(MealCategoryQuery.self, from: data)
                
                self.meals = items.meals.sorted()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
