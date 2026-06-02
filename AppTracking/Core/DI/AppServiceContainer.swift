//
//  AppServiceContainer.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 01/06/26.
//

import Foundation
import Alamofire

final class AppServiceContainer {
    lazy var tokenProvider = UserDefaultsTokenProvider()
    
    lazy var interceptor = AuthInterceptor(tokenProvider: tokenProvider)
    
    lazy var session = Session(interceptor: interceptor)
    
    lazy var httpClient : HttpClientProtocol = HttpClient(session: session)
    
    lazy var unitService = UnitService(httpClient: httpClient)
    
    lazy var unitRepository = UnitRepository(service: unitService)
}
