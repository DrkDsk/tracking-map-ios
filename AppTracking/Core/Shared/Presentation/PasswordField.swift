//
//  PasswordField.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 03/06/26.
//

import SwiftUI

struct PasswordField: View {
    @Binding var password: String
    @State private var isSecure = true
    
    var body: some View {
        HStack {
            if isSecure {
                SecureField("", text: $password, prompt: Text("Contraseña").foregroundStyle(.white.opacity(0.4)))
            } else {
                TextField("", text: $password,  prompt: Text("Contraseña").foregroundStyle(.white.opacity(0.4)))
            }

            Button {
                isSecure.toggle()
            } label: {
                Image(systemName: isSecure ? "eye.slash" : "eye")
            }
            .buttonStyle(.plain)
        }
        .padding(10)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.yellow, lineWidth: 1)
        )
        .foregroundStyle(Color.white)
    }
}
