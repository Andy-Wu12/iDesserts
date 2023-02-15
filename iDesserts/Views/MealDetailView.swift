//
//  MealDetailView.swift
//  iDesserts
//
//  Created by Andy Wu on 2/14/23.
//

import SwiftUI

struct MealDetailView: View {
    var meal: Meal
    
    var body: some View {
        VStack {
            Text("\(meal.strMeal)")
                .font(.title)
            MealRemoteImage(url: meal.strMealThumb)
                .frame(width: 250, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(meal: Meal.example)
    }
}
