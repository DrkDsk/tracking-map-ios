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
    
    var body: some View {
        switch authSession.state {
        case .loading:
            EmptyView()
        case .authenticated:
            DashboardCoordinatorView()
        case .unauthenticated:
            LoginView()
        }
    }
}
