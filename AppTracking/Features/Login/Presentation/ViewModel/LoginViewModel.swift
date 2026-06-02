//
//  LoginViewModel.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 01/06/26.
//

import Foundation
import Combine

@MainActor
final class LoginViewModel : ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    
    
}
