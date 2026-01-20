//
//  ContentView.swift
//  HealthyEats
//
//  Created for Healthy Eat's
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MealPlannerView()
                .tabItem {
                    Label("Meal Plan", systemImage: "calendar")
                }
            
            HealthTrackerView()
                .tabItem {
                    Label("Health", systemImage: "heart.fill")
                }
            
            TipsView()
                .tabItem {
                    Label("Tips", systemImage: "lightbulb.fill")
                }
            
            ProductsView()
                .tabItem {
                    Label("Products", systemImage: "cart.fill")
                }
            
            AIAssistantView()
                .tabItem {
                    Label("AI Assistant", systemImage: "bubble.left.and.bubble.right.fill")
                }
        }
        .tint(.green)
    }
}

#Preview {
    ContentView()
}
