//
//  AppCoordinatorView.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 01/06/26.
//
import Foundation
import SwiftUI

struct AppCoordinatorView: View {
    
    @Environment(AuthSession.self)
    private var authSession
    
    @State private var dashboardSession = DashboardSession()
    
    var body: some View {
        switch authSession.state {
        case .loading:
            EmptyView()
        case .authenticated:
            DashboardCoordinatorView()
                .environment(dashboardSession)
        case .unauthenticated:
            LoginView(
                viewModel: LoginViewModel(repository: AppServiceContainer().loginRepository),
                authSession: authSession
            )
        }
    }
}
