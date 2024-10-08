//
//  CoffeeModel.swift
//  CoffeeShopApp
//
//  Created by Ricky Primayuda Putra on 07/10/24.
//

import SwiftUI

@MainActor
class CoffeeModel: ObservableObject {
    
    let webservice: Webservice
    @Published private(set) var orders: [Order] = []
    
    init(webservice: Webservice) {
        self.webservice = webservice
    }
    
    func populateOrders() async throws {
        orders = try await webservice.getOrders()
    }
    
    func placeOrder(_ order: Order) async throws {
        let newOrder = try await webservice.placeOrder(order: order)
        orders.append(newOrder)
    }
    
    func deleteOrder(_ orderId: Int) async throws {
        let deleteOrder = try await webservice.deleteOrder(orderId: orderId)
        orders = orders.filter { $0.id != deleteOrder.id }
    }
    
    func updateOrder(_ order: Order) async throws {
        let updateOrder = try await webservice.updateOrder(order)
        guard let index = orders.firstIndex(where: { $0.id == updateOrder.id }) else {
            throw CoffeeOrderError.invalidOrderId
        }
        orders[index] = updateOrder
    }
    
}
