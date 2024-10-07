//
//  OrderCellView.swift
//  CoffeeShopApp
//
//  Created by Ricky Primayuda Putra on 07/10/24.
//

import SwiftUI

struct OrderCellView: View {
    
    let order: Order
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(order.name)
                    .accessibilityIdentifier("OrderNameText")
                    .bold()
                Text("\(order.coffeeName) (\(order.size.rawValue))")
                    .accessibilityIdentifier("CoffeeNameAndSizeText")
                    .opacity(0.5)
            }
            Spacer()
            Text(order.total as NSNumber, formatter: NumberFormatter.currency)
                .accessibilityIdentifier("CoffeePriceText")
        }
    }
}
