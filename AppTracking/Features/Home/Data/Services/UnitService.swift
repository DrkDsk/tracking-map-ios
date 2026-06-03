//
//  Trackingservice.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 29/05/26.
//

import Alamofire

final class UnitService : UnitServiceProtocol {
    private let httpClient: HttpClientProtocol
    
    init(httpClient: HttpClientProtocol) {
        self.httpClient = httpClient
    }
    
    func getUnits() async throws -> [UnitData] {
        let response : ApiResponse<[UnitData]> = try await httpClient.request("api/all-units", method: .get)
        
        return response.data
    }
}
