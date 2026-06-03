//
//  UnitRepository.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 29/05/26.
//

final class UnitRepository : UnitRepositoryProtocol {
    
    private let service : UnitServiceProtocol
    
    init(service: UnitServiceProtocol) {
        self.service = service
    }
    
    func getUnits() async throws -> [Unit] {
        let data = try await service.getUnits()
        
        return data.map { $0.toDomain()}
    }
}
