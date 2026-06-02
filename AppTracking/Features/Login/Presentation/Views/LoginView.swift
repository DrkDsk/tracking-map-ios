//
//  LoginView.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 01/06/26.
//
import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.username)
                .padding(10)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(16)
                .foregroundStyle(Color.gray)
            
            Spacer().frame(height: 20)
            
            TextField("Contraseña", text: $viewModel.password)
                .padding(10)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(16)
                .foregroundStyle(Color.gray)
            
            Spacer().frame(height: 40)
            
            Button("Iniciar Sesión") {
                
            }
            .containerRelativeFrame(.horizontal) {
                length,_ in
                length * 0.9
            }
            .padding(.vertical, 12)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .fontWeight(.semibold)
            .cornerRadius(8)
        }
        .padding()
        .frame(alignment: .init(horizontal: .center, vertical: .center))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoginView()
}
