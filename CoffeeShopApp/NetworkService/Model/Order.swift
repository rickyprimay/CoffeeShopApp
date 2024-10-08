//
//  Order.swift
//  CoffeeShopApp
//
//  Created by Ricky Primayuda Putra on 07/10/24.
//

import SwiftUI


enum CoffeeOrderError: Error {
    case invalidOrderId
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
}

struct Order: Codable, Identifiable, Hashable {
    
    var id: Int?
    var name: String
    var coffeeName: String
    var total: Double
    var size: CoffeeSize
    
}
