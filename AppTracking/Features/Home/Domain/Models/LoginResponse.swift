//
//  TrackingResponse.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 29/05/26.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct LoginResponse: Codable {
    let statusCode: Int
    let message: String
    let data: LoginData
}

// MARK: - DataClass
struct LoginData: Codable {
    let accessToken, tokenType: String
    let expiresIn: Int
    let user: User
    let companies: [Company]

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case user, companies
    }
}

// MARK: - Company
struct Company: Codable {
    let id: Int
    let nombre, rfc, email, phone: String
    let active: Int
    let logo: String
    let colorHex, color: String
    let logoHorizontal: String
    let createdAt, updatedAt: String
    let pivot: CompanyPivot

    enum CodingKeys: String, CodingKey {
        case id, nombre, rfc, email, phone, active, logo
        case colorHex = "color_hex"
        case color
        case logoHorizontal = "logo_horizontal"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pivot
    }
}

// MARK: - CompanyPivot
struct CompanyPivot: Codable {
    let userID, companyID, active: Int
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case companyID = "company_id"
        case active
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let nombre, email: String
    let emailVerifiedAt: String?
    let fechaCreacion, createdAt, updatedAt: String
    let profile: Profile
    let companies: [Company]
    let roles: [Role]

    enum CodingKeys: String, CodingKey {
        case id, nombre, email
        case emailVerifiedAt = "email_verified_at"
        case fechaCreacion = "fecha_creacion"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case profile, companies, roles
    }
}

// MARK: - Profile
struct Profile: Codable {
    let id, userID: Int
    let apellido, phone: String
    let avatarURL, fechaNacimiento, direccion: String?
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case apellido, phone
        case avatarURL = "avatar_url"
        case fechaNacimiento = "fecha_nacimiento"
        case direccion
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Role
struct Role: Codable {
    let id: Int
    let name, guardName, createdAt, updatedAt: String
    let pivot: RolePivot

    enum CodingKeys: String, CodingKey {
        case id, name
        case guardName = "guard_name"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pivot
    }
}

// MARK: - RolePivot
struct RolePivot: Codable {
    let modelType: String
    let modelID, roleID: Int

    enum CodingKeys: String, CodingKey {
        case modelType = "model_type"
        case modelID = "model_id"
        case roleID = "role_id"
    }
}

// MARK: - Encode/decode helpers
