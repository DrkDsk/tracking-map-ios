//
//  NetworkClientProtocol.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 29/05/26.
//

import Foundation

protocol NetworkClientProtocol {
    func request<T:Decodable>(endpoint : ApiClient) async throws -> T
}
