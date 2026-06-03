//
//  HomeCoordinator.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 03/06/26.
//

import Foundation
import Combine
import SwiftUI

@Observable
final class HomeCoordinator: AppCoordinator {
    
    private var tokenStorage: TokenStorageProtocol
    
    init(tokenStorage: TokenStorageProtocol) {
        self.tokenStorage = tokenStorage
    }
    
    func checkAuthentication() async {
        let token = tokenStorage.getAccessToken()
        
        guard let token,!token.isEmpty else {
            currentFlow = .login
            return
        }
        
        currentFlow = .home
    }
    
    func loginSucces() {
        path = NavigationPath()
        currentFlow = .home
    }
    
    func logout() {
        path = NavigationPath()
        currentFlow = .login
    }
}
