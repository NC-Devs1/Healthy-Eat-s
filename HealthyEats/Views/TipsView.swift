//
//  TipsView.swift
//  HealthyEats
//
//  Created for Healthy Eat's
//

import SwiftUI

struct Tip: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let description: String
    let category: String
}

struct TipsView: View {
    let tips: [Tip] = [
        Tip(icon: "drop.fill", title: "Stay Hydrated", description: "Drink at least 8 glasses of water daily to maintain optimal body function.", category: "Nutrition"),
        Tip(icon: "leaf.fill", title: "Eat More Greens", description: "Include leafy green vegetables in every meal for essential vitamins and minerals.", category: "Nutrition"),
        Tip(icon: "figure.walk", title: "Walk Daily", description: "Aim for at least 10,000 steps a day to improve cardiovascular health.", category: "Exercise"),
        Tip(icon: "moon.fill", title: "Sleep Well", description: "Get 7-9 hours of quality sleep each night for better recovery and metabolism.", category: "Wellness"),
        Tip(icon: "carrot.fill", title: "Eat Whole Foods", description: "Choose whole, unprocessed foods over packaged alternatives.", category: "Nutrition"),
        Tip(icon: "figure.strengthtraining.traditional", title: "Strength Training", description: "Include resistance exercises 2-3 times per week to build muscle mass.", category: "Exercise"),
        Tip(icon: "brain.head.profile", title: "Mindful Eating", description: "Pay attention to your food, eat slowly, and savor each bite.", category: "Wellness"),
        Tip(icon: "fish.fill", title: "Omega-3 Fatty Acids", description: "Include fatty fish, walnuts, or flaxseeds for brain and heart health.", category: "Nutrition"),
        Tip(icon: "figure.yoga", title: "Stretch Daily", description: "Spend 10-15 minutes stretching to improve flexibility and reduce injury risk.", category: "Exercise"),
        Tip(icon: "sun.max.fill", title: "Get Vitamin D", description: "Spend time outdoors or consider supplements for bone health.", category: "Wellness"),
        Tip(icon: "fork.knife", title: "Portion Control", description: "Use smaller plates and be mindful of serving sizes.", category: "Nutrition"),
        Tip(icon: "figure.run", title: "Cardio Exercise", description: "Get at least 150 minutes of moderate aerobic activity per week.", category: "Exercise"),
        Tip(icon: "heart.fill", title: "Reduce Sodium", description: "Limit salt intake to maintain healthy blood pressure levels.", category: "Nutrition"),
        Tip(icon: "bolt.fill", title: "Pre-Workout Fuel", description: "Eat a balanced snack 1-2 hours before exercising for energy.", category: "Exercise"),
        Tip(icon: "cup.and.saucer.fill", title: "Limit Caffeine", description: "Keep caffeine intake moderate and avoid it late in the day.", category: "Wellness"),
        Tip(icon: "leaf.arrow.triangle.circlepath", title: "Fiber Intake", description: "Aim for 25-30 grams of fiber daily for digestive health.", category: "Nutrition"),
        Tip(icon: "figure.cooldown", title: "Rest Days", description: "Allow your body to recover with 1-2 rest days per week.", category: "Exercise"),
        Tip(icon: "cross.case.fill", title: "Regular Check-ups", description: "Schedule annual health screenings and monitor your vitals.", category: "Wellness"),
        Tip(icon: "scalemass.fill", title: "Track Progress", description: "Monitor your weight and measurements weekly, not daily.", category: "Wellness"),
        Tip(icon: "flame.fill", title: "Metabolism Boost", description: "Eat protein-rich foods to naturally boost your metabolism.", category: "Nutrition")
    ]
    
    @State private var selectedCategory = "All"
    let categories = ["All", "Nutrition", "Exercise", "Wellness"]
    
    var filteredTips: [Tip] {
        if selectedCategory == "All" {
            return tips
        }
        return tips.filter { $0.category == selectedCategory }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Category", selection: $selectedCategory) {
                    ForEach(categories, id: \.self) { category in
                        Text(category).tag(category)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                List(filteredTips) { tip in
                    HStack(alignment: .top, spacing: 15) {
                        Image(systemName: tip.icon)
                            .font(.title2)
                            .foregroundColor(.green)
                            .frame(width: 40)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(tip.title)
                                .font(.headline)
                            Text(tip.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text(tip.category)
                                .font(.caption)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 2)
                                .background(Color.green.opacity(0.2))
                                .cornerRadius(4)
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
            .navigationTitle("Health Tips")
        }
    }
}

#Preview {
    TipsView()
}
