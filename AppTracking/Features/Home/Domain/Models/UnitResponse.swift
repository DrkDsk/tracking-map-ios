// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct UnitResponse: Codable {
    let statusCode: Int
    let message: String
    let data: [UnitData]
}

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
}

// MARK: - Device
struct Device: Codable {
    let channels: String
    let uniqueID: String
    let channelList: [ChannelList]
    let deviceLabel: String
}

// MARK: - ChannelList
struct ChannelList: Codable {
    let enable, channelNo: Int
    let channelAlias: String
    let channelTypeList: [ChannelTypeList]
}

// MARK: - ChannelTypeList
struct ChannelTypeList: Codable {
    let channelTypeID: String
    let channelTypeName: String
}

enum Status: String, Codable {
    case available = "available"
    case enable = "ENABLE"
}

