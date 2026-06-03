//
//  MockingUnitRepository.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 03/06/26.
//

final class MockingUnitRepository: UnitRepositoryProtocol {
    func getUnits() async throws -> [UnitEntity] {
        [
            UnitEntity(id: "1", brand: "Nissan", unitNumber: "Test-100"),
            UnitEntity(id: "2", brand: "Nissan", unitNumber: "Test-100"),
            UnitEntity(id: "3", brand: "Nissan", unitNumber: "Test-100"),
            UnitEntity(id: "4", brand: "Nissan", unitNumber: "Test-100"),
            UnitEntity(id: "5", brand: "Nissan", unitNumber: "Test-100"),
            UnitEntity(id: "6", brand: "Nissan", unitNumber: "Test-100"),
        ]
    }
}
