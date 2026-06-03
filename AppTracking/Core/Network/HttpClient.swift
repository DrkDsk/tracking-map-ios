//
//  NetworkClientProtocol.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 29/05/26.
//

import Foundation
import Alamofire

enum APIConfig {
    static let baseURL : String = {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as? String else {
            fatalError("APP URL NOT FOUND")
        }
        
        return url
    }()
}

final class HttpClient : HttpClientProtocol {
    
    private let session: Session
    private let baseURL: String
    
    private let headers: HTTPHeaders = [
        "Accept": "application/json",
        "Content-Type": "application/json"
    ]
    
    init(session: Session) {
        self.session = session
        self.baseURL = APIConfig.baseURL
    }
    
    private func buildURL(_ endpoint: String) -> String {
            "\(baseURL)/\(endpoint)"
        }
    
    func request<T: Decodable>(
            _ endpoint: String,
            method: HTTPMethod
        ) async throws -> T {
            
            let url = buildURL(endpoint)

            let dataRequest = session
                .request(
                    url,
                    method: method,
                    headers: headers
                )
            
            let response = await dataRequest.serializingData().response
            
            if let data = response.data {
                let _ = try JSONSerialization.jsonObject(with: data)
                //print("JSON:", json)
            }

            switch response.result {
            case .success(let data):
                do {
                    return try JSONDecoder().decode(T.self, from: data)
                } catch {
                    throw error
                }

            case .failure(let error):
                throw error
            }
        }

        func request<T: Decodable, B: Encodable>(
            _ endpoint: String,
            method: HTTPMethod,
            body: B
        ) async throws -> T {
            
            let url = buildURL(endpoint)
            
            let dataRequest = session.request(
                url,
                method: method,
                parameters: body,
                encoder: JSONParameterEncoder.default,
                headers: headers
            )
            
            let response = await dataRequest.serializingData().response
            
            if let data = response.data {
                //print(String(data: data, encoding: .utf8) ?? "")
                let _ = try JSONSerialization.jsonObject(with: data)
                //print("JSON:", json)
            }
            
            switch response.result {
            case .success(let data):
                do {
                    return try JSONDecoder().decode(T.self, from: data)
                } catch {
                    throw error
                }
            case .failure(let error):
                throw error
            }
        }
}
