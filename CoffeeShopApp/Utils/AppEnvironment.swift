//
//  AppEnvironment.swift
//  CoffeeShopApp
//
//  Created by Ricky Primayuda Putra on 07/10/24.
//

import SwiftUI

enum Endpoints {
    
    case allOrders
    
    var path: String {
        switch self {
            case .allOrders:
                return "/orders"
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
    
    var baseUrl : URL {
        switch self {
            case .dev:
                return URL(string: "https://island-bramble.glitch.me")!
            case .test:
                return URL(string: "https://island-bramble.glitch.me")!
        }
    }
}
