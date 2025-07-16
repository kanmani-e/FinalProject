//
//  UnifiedRestaurantView.swift
//  FinalProject
//
//  Created by Keely Hong on 7/16/25.
//

import SwiftUI
import SwiftData

struct UnifiedRestaurantView: View {
    // Fetch all restaurants from SwiftData
    @Query private var restaurants: [Restaurant]
    @Environment(\.modelContext) private var context

    // State variables for filters
    @State private var searchText = ""
    @State private var selectedCuisineIndex = 0
    @State private var displayedRestaurants: [Restaurant] = []
    @State private var budget: Double = 30
    @State private var distance: Double = 5

    // Cuisine options
    let cuisineOptions = [
        "All Cuisines", "Italian", "Indian", "Mexican", "Chinese", "Japanese",
        "Deli", "American", "Mediterranean", "Thai", "French", "Vietnamese"
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    
                    // ✅ Title
                    Text("Find Your Next NYC Bite")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)

                    // ✅ Search Bar
                    TextField("Search restaurants", text: $searchText)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                        .onChange(of: searchText) {
                            applyFilters()
                        }

                    // ✅ Cuisine Picker
                    Picker("Cuisine", selection: $selectedCuisineIndex) {
                        ForEach(cuisineOptions.indices, id: \.self) {
                            Text(cuisineOptions[$0])
                        }
                    }
                    .pickerStyle(.menu)
                    .padding(.horizontal)
                    .onChange(of: selectedCuisineIndex) {
                        applyFilters()
                    }

                    // ✅ Budget Slider
                    VStack(alignment: .leading) {
                        Text("Budget: $\(Int(budget))")
                        Slider(value: $budget, in: 5...100, step: 1)
                    }
                    .padding(.horizontal)
                    .onChange(of: budget) {
                        applyFilters()
                    }

                    // ✅ Distance Slider
                    VStack(alignment: .leading) {
                        Text("Distance: \(String(format: "%.1f", distance)) mi")
                        Slider(value: $distance, in: 1...30, step: 0.5)
                    }
                    .padding(.horizontal)
                    .onChange(of: distance) {
                        applyFilters()
                    }

                    // ✅ Filtered Restaurant List
                    ForEach(displayedRestaurants) { restaurant in
                        VStack(alignment: .leading) {
                            Text(restaurant.name)
                                .font(.headline)
                            Text("\(restaurant.cuisine) • \(restaurant.priceRange) • \(String(format: "%.1f", restaurant.distance)) mi")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                        Divider()
                    }

                    Spacer()
                }
            }
            .onAppear {
                if restaurants.isEmpty {
                    addSampleRestaurants()
                }
                applyFilters()
            }
            .navigationTitle("Restaurants")
        }
    }

    // ✅ Filtering Logic
    func applyFilters() {
        displayedRestaurants = restaurants.filter { r in
            let nameMatch = searchText.isEmpty || r.name.localizedCaseInsensitiveContains(searchText)
            let cuisineMatch = cuisineOptions[selectedCuisineIndex] == "All Cuisines" || r.cuisine == cuisineOptions[selectedCuisineIndex]
            let priceMatch = priceToAverage(r.priceRange) <= budget
            let distanceMatch = r.distance <= distance
            return nameMatch && cuisineMatch && priceMatch && distanceMatch
        }
    }

    func priceToAverage(_ range: String) -> Double {
        switch range {
        case "$5–15": return 10
        case "$15–25": return 20
        case "$25–35": return 30
        case "$35–45": return 40
        case "$45–55": return 50
        case "$55+": return 60
        default: return 100
        }
    }

    func addSampleRestaurants() {
        let samples = [
            Restaurant(name: "Pho Real", priceRange: "$15–25", distance: 2.1, cuisine: "Vietnamese"),
            Restaurant(name: "Taco Galaxy", priceRange: "$5–15", distance: 1.4, cuisine: "Mexican"),
            Restaurant(name: "Bella Pasta", priceRange: "$35–45", distance: 3.3, cuisine: "Italian"),
            Restaurant(name: "Curry Kingdom", priceRange: "$25–35", distance: 4.2, cuisine: "Indian")
        ]
        for restaurant in samples {
            context.insert(restaurant)
        }
        displayedRestaurants = samples
    }
}
