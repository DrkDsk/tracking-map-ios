//
//  TrackingServiceProtocol.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 29/05/26.
//

protocol UnitServiceProtocol {
    func getUnits() async throws -> UnitResponse
}
