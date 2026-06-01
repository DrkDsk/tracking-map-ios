//
//  Untitled.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 29/05/26.
//

import Foundation

final class NetworkClient : NetworkClientProtocol {
    func request<T: Decodable>(endpoint: ApiClient) async throws -> T {
        let request = try endpoint.urlRequest()
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard 200...299 ~= httpResponse.statusCode else {
            throw NetworkError.serverError(statusCode: httpResponse.statusCode)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
