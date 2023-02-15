//
//  MealDetailView.swift
//  iDesserts
//
//  Created by Andy Wu on 2/14/23.
//

import SwiftUI

struct MealDetailView: View {
    var meal: Meal
    
    @StateObject private var viewModel: ViewModel
    
    init(meal: Meal) {
        self.meal = meal
        _viewModel = StateObject(wrappedValue: ViewModel(meal: meal))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("\(meal.strMeal)")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                MealRemoteImage(url: meal.strMealThumb)
                    .frame(width: 250, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                
                Section {
                    ForEach(viewModel.ingredients, id: \.name) { ingredient in
                        HStack {
                            Text(ingredient.name)
                            Text(" - ")
                            Text(ingredient.quantity)
                        }
                    }
                } header: {
                    Text("Ingredients")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                }
                
                Section {
                    Text(viewModel.instructions)
                } header: {
                    Text("Instructions")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .padding()
                
            }
            .task {
                await viewModel.fetchMealDetails()
            }
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(meal: Meal.example)
    }
}
