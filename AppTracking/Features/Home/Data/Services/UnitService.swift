//
//  Trackingservice.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 29/05/26.
//

final class UnitService : UnitServiceProtocol {
    private let network: NetworkClientProtocol
    
    init(network: NetworkClientProtocol) {
        self.network = network
    }
    
    func getUnits() async throws -> UnitResponse {
        try await network.request(endpoint : ApiClient(path: "/api/all-units", method: "GET", queryItems: []))
    }
}
