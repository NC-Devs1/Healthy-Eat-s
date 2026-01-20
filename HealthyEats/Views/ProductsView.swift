//
//  ProductsView.swift
//  HealthyEats
//
//  Created for Healthy Eat's
//

import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let category: String
    let icon: String
    let benefits: [String]
}

struct ProductsView: View {
    let products: [Product] = [
        Product(name: "Organic Quinoa", description: "Complete protein grain", category: "Grains", icon: "leaf.circle.fill", benefits: ["High protein", "Gluten-free", "Rich in fiber"]),
        Product(name: "Greek Yogurt", description: "Probiotic-rich dairy", category: "Dairy", icon: "cup.and.saucer.fill", benefits: ["High protein", "Probiotics", "Calcium"]),
        Product(name: "Wild Salmon", description: "Omega-3 rich fish", category: "Protein", icon: "fish.fill", benefits: ["Omega-3", "High protein", "Vitamin D"]),
        Product(name: "Avocados", description: "Healthy fats superfood", category: "Produce", icon: "leaf.fill", benefits: ["Healthy fats", "Potassium", "Fiber"]),
        Product(name: "Almonds", description: "Nutrient-dense nuts", category: "Nuts", icon: "oval.fill", benefits: ["Vitamin E", "Healthy fats", "Protein"]),
        Product(name: "Spinach", description: "Iron-rich leafy green", category: "Produce", icon: "leaf.circle.fill", benefits: ["Iron", "Vitamins A&C", "Antioxidants"]),
        Product(name: "Blueberries", description: "Antioxidant powerhouse", category: "Produce", icon: "circle.grid.3x3.fill", benefits: ["Antioxidants", "Vitamin C", "Low calorie"]),
        Product(name: "Chia Seeds", description: "Omega-3 super seeds", category: "Seeds", icon: "sparkles", benefits: ["Omega-3", "Fiber", "Protein"]),
        Product(name: "Sweet Potatoes", description: "Complex carb source", category: "Produce", icon: "carrot.fill", benefits: ["Vitamin A", "Fiber", "Potassium"]),
        Product(name: "Olive Oil", description: "Heart-healthy oil", category: "Oils", icon: "drop.fill", benefits: ["Healthy fats", "Antioxidants", "Anti-inflammatory"]),
        Product(name: "Oatmeal", description: "Whole grain breakfast", category: "Grains", icon: "takeoutbag.and.cup.and.straw.fill", benefits: ["Fiber", "Complex carbs", "Heart healthy"]),
        Product(name: "Green Tea", description: "Metabolism booster", category: "Beverages", icon: "mug.fill", benefits: ["Antioxidants", "Metabolism boost", "Low caffeine"])
    ]
    
    @State private var searchText = ""
    
    var filteredProducts: [Product] {
        if searchText.isEmpty {
            return products
        }
        return products.filter { $0.name.localizedCaseInsensitiveContains(searchText) || $0.category.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredProducts) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    HStack(spacing: 15) {
                        Image(systemName: product.icon)
                            .font(.title)
                            .foregroundColor(.green)
                            .frame(width: 50, height: 50)
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(product.name)
                                .font(.headline)
                            Text(product.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text(product.category)
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
            .searchable(text: $searchText, prompt: "Search products")
            .navigationTitle("Healthy Products")
        }
    }
}

struct ProductDetailView: View {
    let product: Product
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(systemName: product.icon)
                    .font(.system(size: 80))
                    .foregroundColor(.green)
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(20)
                
                Text(product.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(product.description)
                    .font(.title3)
                    .foregroundColor(.secondary)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Benefits")
                        .font(.headline)
                    
                    ForEach(product.benefits, id: \.self) { benefit in
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text(benefit)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
            }
            .padding()
        }
        .navigationTitle(product.category)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProductsView()
}
