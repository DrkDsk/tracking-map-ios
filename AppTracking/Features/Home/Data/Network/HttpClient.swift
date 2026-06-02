//
//  NetworkClientProtocol.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 29/05/26.
//

import Foundation
import Alamofire

final class HttpClient : HttpClientProtocol {
    private let session: Session
    
    init (session: Session) {
        self.session = session
    }
    
    func request<T: Decodable>(
            _ url: String,
            method: HTTPMethod = .get
        ) async throws -> T {

            let response = await session
                .request(url, method: method)
                .serializingDecodable(T.self)
                .response

            switch response.result {
            case .success(let value):
                return value

            case .failure(let error):
                throw error
            }
        }
}
