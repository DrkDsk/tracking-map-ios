//
//  LoginService.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 02/06/26.
//

protocol LoginServiceProtocol {
    func login(_ email: String, _ password: String) async throws -> LoginData
}
