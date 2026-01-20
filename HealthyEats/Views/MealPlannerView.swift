//
//  MealPlannerView.swift
//  HealthyEats
//
//  Created for Healthy Eat's
//

import SwiftUI

struct MealPlannerView: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        NavigationStack {
            VStack {
                DatePicker(
                    "Select Date",
                    selection: $selectedDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .padding()
                
                List {
                    Section("Breakfast") {
                        Text("Plan your breakfast")
                            .foregroundColor(.secondary)
                    }
                    
                    Section("Lunch") {
                        Text("Plan your lunch")
                            .foregroundColor(.secondary)
                    }
                    
                    Section("Dinner") {
                        Text("Plan your dinner")
                            .foregroundColor(.secondary)
                    }
                    
                    Section("Snacks") {
                        Text("Plan your snacks")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Meal Planner")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {}) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    MealPlannerView()
}
