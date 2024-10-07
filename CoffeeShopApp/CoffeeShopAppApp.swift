//
//  CoffeeShopAppApp.swift
//  CoffeeShopApp
//
//  Created by Ricky Primayuda Putra on 07/10/24.
//

import SwiftUI

@main
struct CoffeeShopAppApp: App {
    
    @StateObject private var model: CoffeeModel
    
    init() {
        var config = Configuration()
        let webService = WebService(baseUrl: config.environment.baseUrl)
        _model = StateObject(wrappedValue: CoffeeModel(webService: webService))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
        }
    }
}
