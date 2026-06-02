//
//  RequestInterceptor.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 01/06/26.
//

import Foundation

final class UserDefaultsTokenProvider : TokenProvider {
    private let tokenKey = "access_token"
    
    func getToken() -> String? {
        UserDefaults.standard.string(forKey: tokenKey)
    }
}
