
//
//  TokenStorageProtocol.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 02/06/26.
//

protocol TokenStorageProtocol : Sendable {
    func saveAccessToken(_ token: String)
    func saveRefreshToken(_ token: String)

    func getAccessToken() -> String?
    func getRefreshToken() throws -> String?

    func clear()
}
