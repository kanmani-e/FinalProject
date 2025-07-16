//
//  UserInfo.swift
//  FinalProject
//
//  Created by Keely Hong on 7/15/25.
//

import SwiftUI

struct UserInfo: View {
    @State private var budget: Double = 5 // Budget slider (5 to 100+)
    @State private var maxDistance: Double = 10.0 // Distance slider (1 to 30 miles)
    @State private var hotdogBounce: Bool = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 40) {
            Text("Select Your Budget")
                .font(.title)
                .bold()

            VStack(spacing: 16) {
                Text("Use the slider to select your budget!")
                    .font(.headline)

                GeometryReader { geometry in
                    let sliderWidth = geometry.size.width - 32

                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 8)

                        Capsule()
                            .fill(Color.gray)
                            .frame(width: sliderWidth * CGFloat((budget - 5) / 95), height: 8)

                        Image("hotdog")
                            .resizable()
                            .frame(width: 60, height: 30)
                            .scaleEffect(hotdogBounce ? 1.1 : 1.0)
                            .offset(x: sliderWidth * CGFloat((budget - 5) / 95))
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        let location = max(0, min(Double(value.location.x), Double(sliderWidth)))
                                        let percent = location / Double(sliderWidth)
                                        budget = 5 + percent * 95
                                    }
                                    .onEnded { _ in
                                        withAnimation(.interpolatingSpring(stiffness: 300, damping: 5)) {
                                            hotdogBounce = true
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                            withAnimation {
                                                hotdogBounce = false
                                            }
                                        }
                                    }
                            )
                    }
                    .padding(.horizontal, 16)
                }
                .frame(height: 40)

                HStack {
                    Text("$5")
                    Spacer()
                    Text("$100+")
                }
                .padding(.horizontal)

                Text("$\(Int(budget))")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            VStack(spacing: 16) {
                Text("Select Max Distance")
                    .font(.title2)
                    .bold()

                VStack(alignment: .leading) {
                    Text("Max Distance: \(String(format: "%.1f", maxDistance)) mi")
                    Slider(value: $maxDistance, in: 1...30, step: 0.5)
                }
                .padding(.horizontal)
            }

            HStack(spacing: 40) {
                Button("Back") {
                    dismiss()
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.gray)
                .cornerRadius(10)

                NavigationLink(destination: SwiftUIView__k(budget: budget, maxDistance: maxDistance)) {
                    Text("Next")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
        .navigationTitle("Welcome to CraveNYC")
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        UserInfo()
    }
}
