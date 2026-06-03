//
//  UniDataExtension.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 03/06/26.
//

extension UnitData {
    func toDomain() -> Unit {
            Unit(
                id: String(id),
                brand: brand ?? "",
                unitNumber: unitNumber
            )
        }
}
