//
//  dataBody.swift
//  TravelBytes
//
//  Created by Peter Subrata on 31/8/2024.
//

import Foundation

struct FoodItem: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let rating: Int
}

struct RecentSearchItem: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let status: String
    let opensAt: String
    let isOpen: Bool
}
