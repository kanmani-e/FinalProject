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

    let userBudget: Double
    let userDistance: Double

    @State private var searchText = ""
    @State private var selectedCuisineIndex = 0
    @State private var displayedRestaurants: [Restaurant] = []

    let cuisineOptions = ["All Cuisines", "Italian", "Indian", "Mexican", "Chinese", "Japanese", "Deli", "American", "Mediterranean", "Thai", "French", "Vietnamese"]
    let priceOptions = ["$5–15", "$15–25", "$25–35", "$35–45", "$45–55", "$55+"]

    var body: some View {
        VStack(spacing: 16) {
            TextField("Search restaurants", text: $searchText)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            Picker("Cuisine", selection: $selectedCuisineIndex) {
                ForEach(cuisineOptions.indices, id: \.self) { i in
                    Text(cuisineOptions[i])
                }
            }
            .pickerStyle(.menu)
            .padding(.horizontal)

            Button("Search") {
                applyFilters()
            }

            List(displayedRestaurants) { restaurant in
                VStack(alignment: .leading) {
                    Text(restaurant.name)
                        .font(.headline)
                    Text("\(restaurant.cuisine) • \(restaurant.priceRange) • \(String(format: "%.1f", restaurant.distance)) mi")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 4)
            }
            .listStyle(.plain)

            Spacer()
        }
        .navigationTitle("Restaurants")
        .onAppear {
            if restaurants.isEmpty {
                addSampleRestaurants()
            }
            applyFilters()
        }
    }

    func applyFilters() {
        displayedRestaurants = restaurants.filter { r in
            let nameMatch = searchText.isEmpty || r.name.localizedCaseInsensitiveContains(searchText)
            let cuisineMatch = cuisineOptions[selectedCuisineIndex] == "All Cuisines" || r.cuisine == cuisineOptions[selectedCuisineIndex]
            let priceMatch = priceToAverage(r.priceRange) <= userBudget
            let distanceMatch = r.distance <= userDistance
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

#Preview {
    SwiftUIView__k(userBudget: 30, userDistance: 5)
        .modelContainer(for: Restaurant.self, inMemory: true)
}
