//
//  ProfileView.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 03/06/26.
//
import SwiftUI

struct ProfileView : View {
    
    @Environment(DashboardCoordinator.self)
    private var coordinator
    
    var body: some View {
        Button {
            coordinator.pop()
        } label: {
            Image(systemName: "arrow.left")
                .imageScale(.large)
                .foregroundStyle(.tint)
        }
    }
}
