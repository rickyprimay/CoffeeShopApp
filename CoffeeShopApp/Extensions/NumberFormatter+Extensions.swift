//
//  NumberFormatter+Extensions.swift
//  CoffeeShopApp
//
//  Created by Ricky Primayuda Putra on 07/10/24.
//

import SwiftUI

extension NumberFormatter {
    
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        formatter.currencySymbol = "$"
        return formatter
    }
    
}
