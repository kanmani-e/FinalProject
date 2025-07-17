//
//  ContentView.swift
//  FinalProject
//
//  Created by Kanmani Elangovan on 7/15/25.
//

import SwiftUI

struct ContentView: View {
    @State private var pressedButton: String? = nil

    var body: some View {
        NavigationStack {
            ZStack {
                // Red background with gradient
                LinearGradient(gradient: Gradient(colors: [
                    Color(red: 0.835, green: 0.333, blue: 0.314),
                    Color(red: 0.7, green: 0.1, blue: 0.1)
                ]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

                VStack(spacing: 30) {
                    // App Title and Subtitle
                    VStack(spacing: 8) {
                        Text("CraveNYC")
                            .font(.custom("Lobster-Regular", size: 72))
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.3), radius: 4, x: 2, y: 2)

                        Text("Explore NYC’s best bites & events!")
                            .font(.title3)
                            .foregroundColor(.white.opacity(0.95))
                    }
                    .padding(.top, 80)

                    Spacer()

                    //navigation buttons with animation
                    VStack(spacing: 20) {
                        animatedNavLink(title: "🍕 Find Restaurants", color: .blue, destination: UnifiedRestaurantView(), id: "restaurants")
                        animatedNavLink(title: "🎉 View Pop-Up Events", color: .green, destination: popUp(), id: "popups")
                        animatedNavLink(title: "ℹ️ About Us", color: .purple, destination: AboutUsPage(), id: "about")
                    }
                    .padding(.horizontal, 40)

                    Spacer()

                    //NYC skyline image
                    Image("nycSkyline")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .padding(.bottom, 20)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                .padding()
            }
        }
    }

    //animated navigation button
    @ViewBuilder
    func animatedNavLink<Destination: View>(title: String, color: Color, destination: Destination, id: String) -> some View {
        NavigationLink(destination: destination) {
            Text(title)
                .font(.system(size: 22, weight: .bold))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(12)
                .scaleEffect(pressedButton == id ? 0.95 : 1.0)
                .animation(.easeInOut(duration: 0.2), value: pressedButton == id)
        }
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in pressedButton = id }
                .onEnded { _ in pressedButton = nil }
        )
    }
}

#Preview {
    ContentView()
}


