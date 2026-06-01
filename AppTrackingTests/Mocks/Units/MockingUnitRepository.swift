//
//  MockingUnitRepository.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 29/05/26.
//

import Foundation
@testable import AppTracking

final class MockingUnitRepository: UnitRepositoryProtocol{
    func getUnits() async throws -> [UnitData] {
        [
            UnitData(id: 1, status: .available, model: "NISSA", year: 2008, brand: "VW", subBrand: "JETTA", unitNumber: "SENSOR VW", createdAt: Date.now.formatted(), updatedAt: Date.now.formatted(), fleetID: 100, ftcloudID: "1000"),
            UnitData(id: 1, status: .available, model: "NISSA", year: 2008, brand: "VW", subBrand: "JETTA", unitNumber: "SENSOR VW", createdAt: Date.now.formatted(), updatedAt: Date.now.formatted(), fleetID: 100, ftcloudID: "1000"),
        ]
    }
}
