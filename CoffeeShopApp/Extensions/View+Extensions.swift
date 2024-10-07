//
//  View+Extensions.swift
//  CoffeeShopApp
//
//  Created by Ricky Primayuda Putra on 07/10/24.
//

import SwiftUI

extension View {
    
    func centerHorizontally() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    
    
    @ViewBuilder
    func visible(_ value: Bool) -> some View {
        // you can use if-else also
        switch value {
            case true:
                self
            case false:
                EmptyView()
        }
    }
    
}
