//
//  SwiftUIView- k.swift
//  FinalProject
//
//  Created by Kanmani Elangovan on 7/15/25.
//

import SwiftUI
import SwiftData

struct SwiftUIView__k: View {
    @Query private var restaurants: [Restaurant]
    @Environment(\.modelContext) private var context

    @State private var searchText = ""
    @State private var displayedRestaurants: [Restaurant] = []
    @State private var hasAddedSampleData = false

    var budget: Double
    var maxDistance: Double

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                TextField("Search restaurants by name", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)

                if displayedRestaurants.isEmpty {
                    VStack {
                        Text("No restaurants found")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Text("Try adjusting your search")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                } else {
                    List(displayedRestaurants, id: \.id) { restaurant in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(restaurant.name)
                                .font(.headline)
                            Text("\(restaurant.cuisine) • \(restaurant.priceRange) • \(String(format: "%.1f", restaurant.distance)) mi")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 2)
                    }
                    .listStyle(.plain)
                }

                Spacer()
            }
            .navigationTitle("Restaurants")
            .onAppear {
                setupRestaurants()
            }
            .onChange(of: searchText) {
                applyFilters()
            }
        }
    }

    func setupRestaurants() {
        if !hasAddedSampleData {
            addSampleRestaurants()
            hasAddedSampleData = true
        }
        applyFilters()
    }

    func applyFilters() {
        displayedRestaurants = restaurants.filter { restaurant in
            let matchesSearch = searchText.isEmpty ||
                               restaurant.name.localizedCaseInsensitiveContains(searchText)
            let matchesDistance = restaurant.distance <= maxDistance
            let matchesBudget = priceMatches(budget: budget, priceRange: restaurant.priceRange)

            return matchesSearch && matchesDistance && matchesBudget
        }
        
        print("Applied filters:")
        print("Search: '\(searchText)'")
        print("Budget: $\(budget)")
        print("Max Distance: \(maxDistance) mi")
        print("Found \(displayedRestaurants.count) restaurants")
    }

    func priceMatches(budget: Double, priceRange: String) -> Bool {
        let cleaned = priceRange.replacingOccurrences(of: "$", with: "")
        
        let separators = ["–", "-", " - "]
        var parts: [String] = []
        
        for separator in separators {
            if cleaned.contains(separator) {
                parts = cleaned.components(separatedBy: separator)
                break
            }
        }
        
        if parts.isEmpty {
            parts = [cleaned]
        }
        
        guard let minPrice = Double(parts.first?.trimmingCharacters(in: .whitespaces) ?? "") else {
            return true
        }
        
        if parts.count == 1 {
            return budget >= minPrice
        }
        
        guard let maxPrice = Double(parts.last?.trimmingCharacters(in: .whitespaces) ?? "") else {
            return budget >= minPrice
        }
        
        return budget >= minPrice && budget <= maxPrice
    }

    func addSampleRestaurants() {
        // Clear existing restaurants first
        for restaurant in restaurants {
            context.delete(restaurant)
        }
        
        let samples: [Restaurant] = [
            Restaurant(name: "Pho Real", priceRange: "$15–25", distance: 2.1, cuisine: "Vietnamese"),
            Restaurant(name: "Taco Galaxy", priceRange: "$5–15", distance: 1.4, cuisine: "Mexican"),
            Restaurant(name: "Curry Kingdom", priceRange: "$25–35", distance: 4.2, cuisine: "Indian"),
            Restaurant(name: "Bella Pasta", priceRange: "$35–45", distance: 3.3, cuisine: "Italian"),
            Restaurant(name: "Sushi Spot", priceRange: "$45–55", distance: 2.9, cuisine: "Japanese"),
            Restaurant(name: "Wok This Way", priceRange: "$15–25", distance: 1.8, cuisine: "Chinese"),
            Restaurant(name: "The Grilled Cheese", priceRange: "$5–15", distance: 0.9, cuisine: "American"),
            Restaurant(name: "Meat & Bread", priceRange: "$25–35", distance: 3.5, cuisine: "Deli"),
            Restaurant(name: "Kabob Palace", priceRange: "$15–25", distance: 2.4, cuisine: "Mediterranean"),
            Restaurant(name: "Thai Spice", priceRange: "$25–35", distance: 4.1, cuisine: "Thai"),
            Restaurant(name: "Crepes & Co", priceRange: "$35–45", distance: 2.7, cuisine: "French"),
            Restaurant(name: "Ravioli Dreams", priceRange: "$45–55", distance: 5.0, cuisine: "Italian"),
            Restaurant(name: "Biryani Express", priceRange: "$15–25", distance: 1.9, cuisine: "Indian"),
            Restaurant(name: "El Charro", priceRange: "$25–35", distance: 2.6, cuisine: "Mexican"),
            Restaurant(name: "Tempura Town", priceRange: "$35–45", distance: 4.3, cuisine: "Japanese"),
            Restaurant(name: "Lo Mein Lane", priceRange: "$15–25", distance: 2.2, cuisine: "Chinese"),
            Restaurant(name: "Toast Bar", priceRange: "$5–15", distance: 0.7, cuisine: "American"),
            Restaurant(name: "Delicious Deli", priceRange: "$25–35", distance: 3.0, cuisine: "Deli"),
            Restaurant(name: "Falafel House", priceRange: "$5–15", distance: 1.6, cuisine: "Mediterranean"),
            Restaurant(name: "Bangkok Bites", priceRange: "$15–25", distance: 3.8, cuisine: "Thai"),
            Restaurant(name: "Croissant Cafe", priceRange: "$15–25", distance: 2.3, cuisine: "French"),
            Restaurant(name: "Mama Mia", priceRange: "$35–45", distance: 3.4, cuisine: "Italian"),
            Restaurant(name: "Bombay Bistro", priceRange: "$25–35", distance: 2.7, cuisine: "Indian"),
            Restaurant(name: "Fiesta Grill", priceRange: "$15–25", distance: 1.3, cuisine: "Mexican"),
            Restaurant(name: "Wasabi World", priceRange: "$25–35", distance: 4.9, cuisine: "Japanese"),
            Restaurant(name: "Chopsticks & Co", priceRange: "$25–35", distance: 3.6, cuisine: "Chinese"),
            Restaurant(name: "Patty Shack", priceRange: "$15–25", distance: 1.5, cuisine: "American"),
            Restaurant(name: "New York Deli", priceRange: "$15–25", distance: 1.1, cuisine: "Deli"),
            Restaurant(name: "Shawarma Street", priceRange: "$25–35", distance: 2.0, cuisine: "Mediterranean"),
            Restaurant(name: "Lemongrass Lane", priceRange: "$15–25", distance: 1.7, cuisine: "Thai"),
            Restaurant(name: "Parisian Eats", priceRange: "$35–45", distance: 4.4, cuisine: "French"),
            Restaurant(name: "Ragu House", priceRange: "$45–55", distance: 5.2, cuisine: "Italian"),
            Restaurant(name: "Masala Magic", priceRange: "$25–35", distance: 2.8, cuisine: "Indian"),
            Restaurant(name: "Baja Fresh", priceRange: "$15–25", distance: 1.0, cuisine: "Mexican"),
            Restaurant(name: "Sakura Table", priceRange: "$25–35", distance: 3.2, cuisine: "Japanese"),
            Restaurant(name: "Dragon Bowl", priceRange: "$15–25", distance: 2.5, cuisine: "Chinese"),
            Restaurant(name: "Burger Bros", priceRange: "$5–15", distance: 0.6, cuisine: "American"),
            Restaurant(name: "Sandwich Central", priceRange: "$15–25", distance: 2.9, cuisine: "Deli"),
            Restaurant(name: "Mediterraneo", priceRange: "$35–45", distance: 4.0, cuisine: "Mediterranean"),
            Restaurant(name: "Pad Thai Palace", priceRange: "$25–35", distance: 3.1, cuisine: "Thai")
        ]
        
        for restaurant in samples {
            context.insert(restaurant)
        }
        
        do {
            try context.save()
            print("Successfully added \(samples.count) restaurants")
        } catch {
            print("Error saving restaurants: \(error)")
        }
    }
}

#Preview {
    SwiftUIView__k(budget: 20, maxDistance: 10)
        .modelContainer(for: Restaurant.self, inMemory: true)
}
