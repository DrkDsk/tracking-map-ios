//
//  UnitViewModel.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 29/05/26.
//

import Foundation
import Combine

@MainActor
class UnitViewModel: ObservableObject {
    @Published var units: [UnitEntity]
    @Published var searchQuery: String = ""
    
    private let unitRepository: UnitRepositoryProtocol
    
    init(unitRepository: UnitRepositoryProtocol) {
        self.units = []
        self.unitRepository = unitRepository
    }
    
    func loadUnits() async {
        do {
            units = try await unitRepository.getUnits()
        } catch {
            print(error)
        }
    }
}
