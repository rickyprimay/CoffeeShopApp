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
    
    private var baseUrl: URL
    
    init(baseUrl: URL ) {
        self.baseUrl = baseUrl
    }
    
    func getOrder() async throws -> [Order] {
        
        guard let baseUrl = URL(string: Endpoints.allOrders.path, relativeTo: self.baseUrl) else {
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
