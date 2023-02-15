//
//  MealListView.swift
//  iDesserts
//
//  Created by Andy Wu on 2/14/23.
//

import SwiftUI

struct MealListView: View {
    @State private var meals = [Meal]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(meals, id: \.idMeal) { meal in
                    Text(meal.strMeal)
                }
            }
            .navigationTitle("Dessert Recipes")
            .task {
                await fetchDesserts()
            }
        }
    }
    
    func fetchDesserts() async {
        let urlString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL: \(urlString)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let items = try JSONDecoder().decode(MealCategoryQuery.self, from: data)
            
            meals = items.meals.sorted()
        } catch {
            // Handle error here - this should just create empty meals array when in ViewModel
            print(error.localizedDescription)
        }
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
