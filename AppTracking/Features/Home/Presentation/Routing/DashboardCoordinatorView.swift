//
//  DashboardCoordinatorView.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 01/06/26.
//

import SwiftUI

struct DashboardCoordinatorView : View {
    
    @State private var dashboardCoordinator: DashboardCoordinator
    
    init() {
        _dashboardCoordinator = State(wrappedValue: DashboardCoordinator())
    }
    
    var body : some View {
        NavigationStack(path: $dashboardCoordinator.path) {
            UnitView(viewModel: UnitViewModel(unitRepository: AppServiceContainer().unitRepository))
            .navigationDestination(for: DashboardRoute.self) { route in
                switch route {
                case .profile:
                    ProfileView()
                }
            }
        }
        .environment(dashboardCoordinator)
    }
}
