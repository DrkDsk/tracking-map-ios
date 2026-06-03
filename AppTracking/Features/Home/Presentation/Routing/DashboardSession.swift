//
//  DashboardSession.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 01/06/26.
//
import Foundation
import SwiftUI

enum DashboardCoordinatorState {
    case loadUnits
    case showUnit(unitId: Int)
    case profile
}

@Observable
final class DashboardSession {
    var state: DashboardCoordinatorState = .loadUnits
    
    func profile() {
        state = .profile
    }
}
