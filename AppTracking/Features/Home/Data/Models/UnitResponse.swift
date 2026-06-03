// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome

// MARK: - Datum
struct UnitData: Codable {
    let id: Int
    let status: Status
    let model: String?
    let year: Int?
    let brand: String?
    let subBrand: String?
    let unitNumber: String
    let createdAt, updatedAt: String
    let fleetID: Int?
    let ftcloudID: String?
    
    enum CodingKeys: String, CodingKey {
        case id, status, model, year, brand
        case subBrand = "sub_brand"
        case unitNumber = "unit_number"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case fleetID = "fleet_id"
        case ftcloudID = "ftcloud_id"
    }
}

enum Status: String, Codable {
    case available = "available"
    case enable = "ENABLE"
}
