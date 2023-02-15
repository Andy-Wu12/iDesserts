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
                    .font(.title)
                MealRemoteImage(url: meal.strMealThumb)
                    .frame(width: 250, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Section {
                    Text(viewModel.instructions)
                        .padding()
                } header: {
                    Text("Instructions")
                }
                
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
