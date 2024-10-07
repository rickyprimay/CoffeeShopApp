//
//  CoffeeModel.swift
//  CoffeeShopApp
//
//  Created by Ricky Primayuda Putra on 07/10/24.
//

import SwiftUI

@MainActor
class CoffeeModel: ObservableObject {
    
    let webService: WebService
    @Published private(set) var orders: [Order] = []
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func populateOrders() async throws {
        let orders = try await webService.getOrder()
        DispatchQueue.main.async {
            self.orders = orders
        }
    }
}
