//
//  NetworkClientProtocol.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 29/05/26.
//

import Foundation
import Alamofire

protocol HttpClientProtocol {
    func request<T: Decodable>(
            _ url: String,
            method: HTTPMethod
        ) async throws -> T
    
    func request<T: Decodable, B: Encodable>(
            _ endpoint: String,
            method: HTTPMethod,
            body: B
        ) async throws -> T
}
