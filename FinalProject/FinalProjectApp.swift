//
//  FinalProjectApp.swift
//  FinalProject
//
//  Created by Kanmani Elangovan on 7/15/25.
//

import SwiftUI
import SwiftData

@main
struct FinalProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Restaurant.self)
        }
    }
}

