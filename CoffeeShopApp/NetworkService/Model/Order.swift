//
//  Order.swift
//  CoffeeShopApp
//
//  Created by Ricky Primayuda Putra on 07/10/24.
//

import SwiftUI

enum CoffeSize: String, Codable, CaseIterable {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
}

struct Order: Codable, Identifiable, Hashable {
    
    let id: Int?
    let name: String
    let coffeeName: String
    var total: Double
    var size: CoffeSize
    
}
