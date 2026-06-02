//
//  TokenProvider.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 01/06/26.
//

protocol TokenProvider : Sendable {
    func getToken() -> String?
}
