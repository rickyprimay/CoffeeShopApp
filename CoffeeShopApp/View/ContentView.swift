//
//  ContentView.swift
//  CoffeeShopApp
//
//  Created by Ricky Primayuda Putra on 07/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var model: CoffeeModel
    
    private func populateOrders() async {
        do {
            try await model.populateOrders()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack {
            if model.orders.isEmpty {
                Text("No Orders Avalaible!").accessibilityIdentifier("noOrdersText")
            } else {
                List(model.orders) { order in
                    OrderCellView(order: order)
                }
            }
        }.task {
            await populateOrders()
        }
    }
}

#Preview {
    var config = Configuration()
    ContentView().environmentObject(CoffeeModel(webService: WebService(baseUrl: config.environment.baseUrl)))
}

