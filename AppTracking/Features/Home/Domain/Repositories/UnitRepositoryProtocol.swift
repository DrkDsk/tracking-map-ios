//
//  TrackingRepositoryProtocol.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 29/05/26.
//

protocol UnitRepositoryProtocol {
    func getUnits() async throws -> [Unit]
}
