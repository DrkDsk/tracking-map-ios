//
//  LoginRepository.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 02/06/26.
//

final class LoginRepository : LoginRepositoryProtocol {
    private let service: LoginServiceProtocol
    private let tokenStorage: TokenStorage
    
    init(service: LoginServiceProtocol, tokenStorage: TokenStorage) {
        self.service = service
        self.tokenStorage = tokenStorage
    }
    
    func login(_ email: String, _ password: String) async throws -> LoginData {
        let dto = try await service.login(email, password)
        let data = dto
        
        tokenStorage.saveAccessToken(data.accessToken)
        
        return data
    }
}
