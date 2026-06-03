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
            AppTextField(title: "Email", text: $viewModel.username, type: .phone, validations: [.required, .email])
            Spacer().frame(height: 20)
            PasswordField(password: $viewModel.password)
            
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
