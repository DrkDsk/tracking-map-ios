//
//  LoginService.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 02/06/26.
//
import Foundation
import Alamofire

final class LoginService : LoginServiceProtocol {
    private let httpClient: HttpClientProtocol
    
    init(httpClient: HttpClientProtocol) {
        self.httpClient = httpClient
    }
    
    func login(_ email: String, _ password: String) async throws -> LoginData {
        let body = LoginRequestDTO(
            email: email,
            password: password
        )
        
        let response : ApiResponse<LoginData> =  try await httpClient.request("api/auth/login", method: .post, body: body)
        
        return response.data
    }
}
