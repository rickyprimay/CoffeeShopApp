//
//  AppEnvironment.swift
//  CoffeeShopApp
//
//  Created by Ricky Primayuda Putra on 07/10/24.
//

import SwiftUI

enum Endpoints {
    
    case allOrders
    case placeOrder
    case deleteOrder(Int)
    
    var path: String {
        switch self {
            case .allOrders:
                return "/test/orders"
            case .placeOrder:
                return "/test/new-order"
            case .deleteOrder(let orderId):
                return "test/orders/\(orderId)"
        }
    }
}

struct Configuration {
    
    lazy var environment: AppEnvironment = {
        
        guard let env = ProcessInfo.processInfo.environment["ENV"] else {
            return AppEnvironment.dev
        }
        
        if env == "TEST" {
            return AppEnvironment.test
        }
        
        return AppEnvironment.dev
        
    }()
    
}

enum AppEnvironment: String {
    case dev
    case test
    
    var baseURL: URL {
        switch self {
            case .dev:
                return URL(string: "https://island-bramble.glitch.me")!
            case .test:
                return URL(string: "https://island-bramble.glitch.me")!
        }
    }
    
}
