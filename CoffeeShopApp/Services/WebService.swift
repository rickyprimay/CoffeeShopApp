//
//  WebService.swift
//  CoffeeShopApp
//
//  Created by Ricky Primayuda Putra on 07/10/24.
//

import SwiftUI

enum NetworkError: Error {
    case badRequest
    case decodingError
    case badUrl
}

class WebService {
    
    func getOrder() async throws -> [Order] {
        
        guard let baseUrl = URL(string: "https://island-bramble-glitch.glitch.me/test/orders") else {
            throw NetworkError.badUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: baseUrl)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        guard let orders = try? JSONDecoder().decode([Order].self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return orders
        
    }
    
}
