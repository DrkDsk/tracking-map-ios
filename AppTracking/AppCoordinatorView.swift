//
//  AppCoordinatorView.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 01/06/26.
//
import Foundation
import SwiftUI

struct AppCoordinatorView: View {
    
    @State private var coordinator : HomeCoordinator
    
    init() {
        _coordinator = State(wrappedValue: HomeCoordinator(tokenStorage: AppServiceContainer().tokenStorage))
    }
    
    var body: some View {
        Group {
            switch coordinator.currentFlow {
            case .login:
                LoginView(
                    viewModel: LoginViewModel(repository: AppServiceContainer().loginRepository)
                )
            case .home:
                DashboardCoordinatorView()
            }
        }
        .environment(coordinator)
        .task {
            await coordinator.checkAuthentication()
        }
    }
}
