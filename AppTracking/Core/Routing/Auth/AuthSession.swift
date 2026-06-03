//
//  AuthSession.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 01/06/26.
//
import Foundation
import Combine
import SwiftUI

enum AuthState {
    case loading
    case authenticated
    case unauthenticated
}

@Observable
final class AuthSession {
    var state: AuthState = .loading
    
    private var tokenStorage: TokenStorageProtocol
    
    init(tokenStorage: TokenStorageProtocol) {
        self.tokenStorage = tokenStorage
    }
    
    func bootstrap() async {
        
        let token = tokenStorage.getAccessToken()
        
        guard let token,!token.isEmpty else {
            state = .unauthenticated
            return
        }
        
        state = .authenticated
    }
    
    func loginSucces() {
        state = .authenticated
    }
    
    func logout() {
        state = .unauthenticated
    }
}
