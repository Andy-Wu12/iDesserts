//
//  MealListView.swift
//  iDesserts
//
//  Created by Andy Wu on 2/14/23.
//

import SwiftUI

struct MealListView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.meals, id: \.idMeal) { meal in
                    NavigationLink {
                        MealDetailView(meal: meal)
                    } label: {
                        Text("\(meal.strMeal)")
                    }
                }
            }
            .navigationTitle("Dessert Recipes")
            .task {
                await viewModel.fetchDesserts()
            }
        }
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
