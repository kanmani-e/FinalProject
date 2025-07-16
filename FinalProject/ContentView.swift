//
//  ContentView.swift
//  FinalProject
//
//  Created by Kanmani Elangovan on 7/15/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.835, green: 0.333, blue: 0.314)
                    .ignoresSafeArea()

                VStack(spacing: 40) {
                    
                    // App Title
                    Text("CraveNYC")
                        .font(.custom("Lobster-Regular", size: 48))
                        .foregroundColor(Color(red: 0.97, green: 0.96, blue: 0.922))
                        .padding(.top, 80)

                    Spacer()

                    // Go to Restaurant Search
                    NavigationLink(destination: UnifiedRestaurantView()) {
                        Text("🍽️ Find Restaurants")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 16)
                            .background(Color.blue)
                            .cornerRadius(12)
                    }

                    // Go to Pop-Up Events
                    NavigationLink(destination: popUp()) {
                        Text("🎉 View Pop-Up Events")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 16)
                            .background(Color.green)
                            .cornerRadius(12)
                    }

                    Spacer()

                    Text("Explore NYC’s best bites & events")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.bottom, 40)
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}

