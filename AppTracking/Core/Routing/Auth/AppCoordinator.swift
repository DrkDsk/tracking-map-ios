//
//  AuthSession.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 01/06/26.
//
import Foundation
import Combine
import SwiftUI

enum AppFlow {
    case login
    case home
}

@Observable
class AppCoordinator : AppCoordinatorProtocol {
    var currentFlow: AppFlow = .login
    var path = NavigationPath()
    
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func popToRoot() {
        path = NavigationPath()
    }
}
