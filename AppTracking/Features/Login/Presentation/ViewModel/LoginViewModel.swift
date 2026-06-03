//
//  LoginViewModel.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 01/06/26.
//

import Foundation
import Combine

@MainActor
final class LoginViewModel : ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    
    private let repository: LoginRepositoryProtocol
    
    init(repository: LoginRepositoryProtocol) {
        self.repository = repository
    }
    
    func login() async throws {
        do {
            let email = self.username
            let password = self.password
            
            _ = try await repository.login(email, password)
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
    
}
