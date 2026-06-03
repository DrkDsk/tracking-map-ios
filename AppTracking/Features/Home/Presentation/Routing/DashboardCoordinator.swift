//
//  DashboardSession.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 01/06/26.
//
import Foundation
import SwiftUI

enum DashboardRoute: Hashable {
    case profile
}

@Observable
final class DashboardCoordinator : AppCoordinator {
    func profile() {
        path.append(DashboardRoute.profile)
    }
}
