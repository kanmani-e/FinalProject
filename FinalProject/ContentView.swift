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
                Color(red: 0.835, green: 0.333, blue: 0.314) // background color
                    .ignoresSafeArea()

                VStack(spacing: 30) {
                    Text("CraveNYC") // title
                        .font(.custom("Lobster-Regular", size: 48))
                        .foregroundColor(Color(red: 0.97, green: 0.96, blue: 0.922))

                    NavigationLink(destination: UserInfo()) {
                        Text("Click here to begin") // button to navigate to next screen
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(Color(red: 0.835, green: 0.333, blue: 0.314))
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(Color(red: 0.97, green: 0.96, blue: 0.922))
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
