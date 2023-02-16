//
//  MealListView.swift
//  iDesserts
//
//  Created by Andy Wu on 2/14/23.
//

import SwiftUI

struct MealListView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.meals, id: \.id) { meal in
                    NavigationLink {
                        MealDetailView(meal: meal)
                            .navigationTitle(meal.name)
                    } label: {
                        Text("\(meal.name)")
                    }
                }
            }
            .navigationTitle("\(viewModel.category.rawValue) Recipes")
            .toolbar {
                Button("Change category") {
                    viewModel.changingCategory = true
                }
            }
            .task {
                await viewModel.fetchMealCategory()
            }
        }
        .onChange(of: viewModel.category) { _ in
            Task {
                await viewModel.fetchMealCategory()
            }
        }
        .sheet(isPresented: $viewModel.changingCategory) {
            print(viewModel.changingCategory)
        } content: {
            Form {
                Picker("Category", selection: $viewModel.category) {
                    ForEach(MealCategory.allCases, id: \.rawValue) {
                        Text($0.rawValue)
                            .tag($0)
                    }
                }
            }
        }
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
