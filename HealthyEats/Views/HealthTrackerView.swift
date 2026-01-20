//
//  HealthTrackerView.swift
//  HealthyEats
//
//  Created for Healthy Eat's
//

import SwiftUI

struct HealthTrackerView: View {
    @State private var weight: Double = 70.0
    @State private var height: Double = 170.0
    @State private var dailyCalories: Int = 2000
    
    var bmi: Double {
        let heightInMeters = height / 100
        return weight / (heightInMeters * heightInMeters)
    }
    
    var bmiCategory: String {
        switch bmi {
        case ..<18.5:
            return "Underweight"
        case 18.5..<25:
            return "Normal"
        case 25..<30:
            return "Overweight"
        default:
            return "Obese"
        }
    }
    
    var bmiColor: Color {
        switch bmi {
        case ..<18.5:
            return .blue
        case 18.5..<25:
            return .green
        case 25..<30:
            return .orange
        default:
            return .red
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Body Measurements") {
                    HStack {
                        Text("Weight")
                        Spacer()
                        Text("\(weight, specifier: "%.1f") kg")
                            .foregroundColor(.secondary)
                    }
                    Slider(value: $weight, in: 30...200, step: 0.1)
                    
                    HStack {
                        Text("Height")
                        Spacer()
                        Text("\(height, specifier: "%.0f") cm")
                            .foregroundColor(.secondary)
                    }
                    Slider(value: $height, in: 100...250, step: 1)
                }
                
                Section("BMI") {
                    HStack {
                        Text("Your BMI")
                        Spacer()
                        Text("\(bmi, specifier: "%.1f")")
                            .fontWeight(.bold)
                            .foregroundColor(bmiColor)
                    }
                    
                    HStack {
                        Text("Category")
                        Spacer()
                        Text(bmiCategory)
                            .foregroundColor(bmiColor)
                    }
                }
                
                Section("Daily Calories") {
                    Stepper(value: $dailyCalories, in: 1000...5000, step: 100) {
                        HStack {
                            Text("Target")
                            Spacer()
                            Text("\(dailyCalories) kcal")
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    ProgressView(value: 0.65) {
                        Text("Today's Progress")
                    } currentValueLabel: {
                        Text("1300 / \(dailyCalories) kcal")
                    }
                    .tint(.green)
                }
            }
            .navigationTitle("Health Tracker")
        }
    }
}

#Preview {
    HealthTrackerView()
}
