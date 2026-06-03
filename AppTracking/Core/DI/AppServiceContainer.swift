//
//  AppServiceContainer.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 01/06/26.
//

import Foundation
import Alamofire

final class AppServiceContainer {
    lazy var tokenStorage = TokenStorage()
    lazy var interceptor = AuthInterceptor(tokenStorage: tokenStorage)
    lazy var session = Session(interceptor: interceptor)
    lazy var httpClient : HttpClientProtocol = HttpClient(session: session)
    
    lazy var unitService = UnitService(httpClient: httpClient)
    lazy var loginService = LoginService(httpClient: httpClient)
    
    lazy var loginRepository = LoginRepository(service: loginService, tokenStorage: tokenStorage)
    lazy var unitRepository = UnitRepository(service: unitService)
}
