//
//  LoginView.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 01/06/26.
//
import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel: LoginViewModel
    private let authSession: AuthSession
    
    init(viewModel: LoginViewModel, authSession: AuthSession) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.authSession = authSession
    }
    
    var body: some View {
        VStack {
            TextField(
                "",
                text: $viewModel.username,
                prompt: Text("Email").foregroundStyle(.white.opacity(0.4))
            )
            .padding(10)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.yellow, lineWidth: 1)
            )
            .foregroundStyle(Color.white)
            
            Spacer().frame(height: 20)
            
            TextField(
                "",
                text: $viewModel.password,
                prompt: Text("Contraseña").foregroundStyle(.white.opacity(0.4))
            )
            .padding(10)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.yellow, lineWidth: 1)
            )
            .foregroundStyle(Color.white)
            
            Spacer().frame(height: 40)
            
            Button("Iniciar Sesión") {
                Task {
                    try await viewModel.login()
                    authSession.loginSucces()
                }
            }
            .containerRelativeFrame(.horizontal) {
                length,_ in
                length * 0.9
            }
            .padding(.vertical, 12)
            .background(Color.yellow)
            .foregroundColor(Color.black)
            .fontWeight(.semibold)
            .cornerRadius(8)
        }
        .padding()
        .frame(alignment: .init(horizontal: .center, vertical: .center))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

#Preview {
    LoginView(
            viewModel: LoginViewModel(
                repository:
                    LoginRepository(
                        service: AppServiceContainer().loginService,
                        tokenStorage: AppServiceContainer().tokenStorage
                    )
            ),
            authSession: AuthSession(tokenStorage: AppServiceContainer().tokenStorage)
        )
}
