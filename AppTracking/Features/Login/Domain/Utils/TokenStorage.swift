//
//  TokenStorage.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 02/06/26.
//

import Foundation
import Security

final class TokenStorage : TokenStorageProtocol {
    private let service = "com.apptracking.auth"
    
    func saveAccessToken(_ token: String) {
        do {
            try save(
                token,
                account: "access_token"
            )
        } catch {
            
        }
    }

    func getAccessToken() -> String? {
        do {
            let value = try get(account: "access_token")
            return value
        } catch {
            return nil
        }
    }

    func saveRefreshToken(_ token: String) {
        do {
            try save(
                token,
                account: "refresh_token"
            )
        } catch {
            
        }
    }

    func getRefreshToken() throws -> String? {
        try get(account: "refresh_token")
    }

    func clear() {
        try? delete(account: "access_token")
        try? delete(account: "refresh_token")
    }
    
    private func save(
            _ value: String,
            account: String
        ) throws {

            let data = Data(value.utf8)

            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: account,
                kSecValueData as String: data
            ]

            SecItemDelete(query as CFDictionary)

            let status = SecItemAdd(
                query as CFDictionary,
                nil
            )

            guard status == errSecSuccess else {
                throw KeychainError.unhandled(status)
            }
    }
    
    private func get(
            account: String
        ) throws -> String? {

            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: account,
                kSecReturnData as String: true,
                kSecMatchLimit as String: kSecMatchLimitOne
            ]

            var item: CFTypeRef?

            let status = SecItemCopyMatching(
                query as CFDictionary,
                &item
            )

            if status == errSecItemNotFound {
                return nil
            }

            guard status == errSecSuccess else {
                throw KeychainError.readFailed(status)
            }

            guard let data = item as? Data else {
                return nil
            }

            return String(
                data: data,
                encoding: .utf8
            )
    }
    
    private func delete(account: String) throws {

            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: account
            ]

            let status = SecItemDelete(
                query as CFDictionary
            )

            guard status == errSecSuccess ||
                  status == errSecItemNotFound else {
                throw KeychainError.deleteFailed(status)
            }
        }
}
