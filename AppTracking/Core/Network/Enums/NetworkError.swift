//
//  NetworkError.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 29/05/26.
//

enum NetworkError : Error {
    case invalidURL
    case invalidResponse
    case serverError(statusCode : Int)
    case decodingError
}
