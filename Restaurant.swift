//
//  Restaurant.swift
//  FinalProject
//
//  Created by Kanmani Elangovan on 7/15/25.
//

import Foundation
import SwiftData

@Model
class Restaurant {
    var id: UUID
    var name: String
    var priceRange: String
    var distance: Double
    var cuisine: String
    
    init(name: String, priceRange: String, distance: Double, cuisine: String) {
        self.id = UUID()
        self.name = name
        self.priceRange = priceRange
        self.distance = distance
        self.cuisine = cuisine
    }
}
