//
//  UserInfo.swift
//  FinalProject
//
//  Created by Keely Hong on 7/15/25.
//

import SwiftUI

struct UserInfo: View {
    @State private var budget: Double = 5
    @State private var distance: Double = 1

    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                Text("Budget & Distance")
                    .font(.title).bold()

                VStack(spacing: 20) {
                    Text("Budget: $\(Int(budget))")
                    Slider(value: $budget, in: 5...100, step: 1)
                        .padding(.horizontal)

                    Text("Distance: \(String(format: "%.1f", distance)) mi")
                    Slider(value: $distance, in: 1...30, step: 0.5)
                        .padding(.horizontal)
                }

                NavigationLink(destination: SwiftUIView__k(userBudget: budget, userDistance: distance)) {
                    Text("Find Restaurants")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("Welcome to CraveNYC")
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    UserInfo()
}
