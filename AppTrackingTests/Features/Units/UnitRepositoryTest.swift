//
//  UnitRepositoryTest.swift
//  AppTrackingTests
//
//  Created by Alfredo Palacios on 29/05/26.
//

import Testing
@testable import AppTracking

struct UnitRepositoryTest {

    @Test
    func testLoadUnits() async throws {
        let repository = MockingUnitRepository()
        
        let units = try await repository.getUnits()
        
        #expect(units.count == 2)
    }
}
