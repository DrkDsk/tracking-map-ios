//
//  AuthInterceptor.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 01/06/26.
//

import Alamofire
import Foundation

final class AuthInterceptor: RequestInterceptor {
    private let tokenStorage: TokenStorageProtocol
    
    init(tokenStorage: TokenStorageProtocol) {
        self.tokenStorage = tokenStorage
    }
    
    func adapt(
        _ urlRequest: URLRequest,
       for session: Session,
        completion: @escaping (Result<URLRequest, Error>) -> Void) -> Void {
            var request = urlRequest
            
            if let token = tokenStorage.getAccessToken() {
                request.headers.add(
                    .authorization(bearerToken: token)
                )
            }
            
            completion(.success(request))
        }
}
