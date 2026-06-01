//
//  HttpClient.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 29/05/26.
//

import Foundation

struct ApiClient {
    let path: String
    let method: String
    let queryItems : [URLQueryItem]
    
    func urlRequest() throws -> URLRequest {
        var components = URLComponents(
            string: "http://localhost:8000"
        )
        
        components?.path = path
        components?.queryItems = queryItems
        
        guard let url = components?.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        return request
    }
}
