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

    let cuisineOptions = [
        "All Cuisines", "Italian", "Indian", "Mexican", "Chinese", "Japanese",
        "Deli", "American", "Mediterranean", "Thai", "French", "Vietnamese"
    ]
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
            resetRestaurants()      // ✅ Wipe old data
            addSampleRestaurants()  // ✅ Add full updated list
            applyFilters()          // ✅ Filter them after reload
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

    // ✅ NEW: Clear old restaurants before adding new ones
    func resetRestaurants() {
        for restaurant in restaurants {
            context.delete(restaurant)
        }
        try? context.save()
    }

    func addSampleRestaurants() {
        let samples = [
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
        displayedRestaurants = samples
    }
}

#Preview {
    SwiftUIView__k(userBudget: 30, userDistance: 5)
        .modelContainer(for: Restaurant.self, inMemory: true)
}

