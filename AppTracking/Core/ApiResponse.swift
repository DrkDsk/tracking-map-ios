//
//  ApiResponse.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 02/06/26.
//

struct ApiResponse<T:Codable> : Codable {
    let message: String
    let data: T
}
