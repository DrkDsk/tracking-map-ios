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
    
    func getUnits() async throws -> [UnitData] {
        let dto = try await service.getUnits()
        let data = dto.data
        
        return data
    }
}
