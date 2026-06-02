//
//  DashboardCoordinatorView.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 01/06/26.
//

import SwiftUI

struct DashboardCoordinatorView : View {
    
    @Environment(DashboardSession.self)
    private var dashboardSession
    
    var body : some View {
        switch dashboardSession.state {
            case .loadUnits:
                UnitView()
            default:
                EmptyView()
        }
    }
}
