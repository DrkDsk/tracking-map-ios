//
//  LoginRepositoryProtocol.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 02/06/26.
//

protocol LoginRepositoryProtocol {
    func login(_ email: String, _ password: String) async throws -> LoginData
}
