//
//  AppTrackingApp.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 29/05/26.
//

import SwiftUI

@main
struct AppTrackingApp: App {
    

    @State private var authSession = AuthSession(tokenProvider: AppServiceContainer().tokenProvider)
    private let container = AppServiceContainer()
    
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView()
                .environment(authSession)
                .task {
                    await authSession.bootstrap()
                }
        }
    }
}
