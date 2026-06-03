//
//  KeychainError.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 02/06/26.
//

import Security

enum KeychainError: Error {
    case saveFailed(OSStatus)
    case unhandled(OSStatus)
    case readFailed(OSStatus)
    case deleteFailed(OSStatus)
    
    var errorDescription: String? {
            switch self {
            case .saveFailed(let status):
                return "Keychain save failed: \(status)"

            case .readFailed(let status):
                return "Keychain read failed: \(status)"

            case .deleteFailed(let status):
                return "Keychain delete failed: \(status)"
                
            default :
                return "Unhandled error"
            }
        }

}
