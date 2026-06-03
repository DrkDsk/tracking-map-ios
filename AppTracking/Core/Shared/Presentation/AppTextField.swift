//
//  AppTextField.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 03/06/26.
//

import SwiftUI

struct AppTextField : View {
    
    let title: String
    @Binding var text: String
    let type: InputTextFieldType
    let validations: [ValidationRules]
    @State private var errorMessage: String?
    
    var body: some View {
        
        VStack(alignment: .leading) {
            TextField(
                "",
                text: $text,
                prompt: Text(title)
                    .foregroundStyle(.white.opacity(0.4))
            )
            .onChange(of: text) {
                validate()
            }
            .keyboardType(type.keyboardType)
            .textInputAutocapitalization(type.autocapitalization)
            .autocorrectionDisabled(type.autocorrectionDisabled)
            
            if let errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
                    .font(.caption)
            }
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
    
    private func validate() {
       errorMessage = validations
           .compactMap { $0.validate(text) }
           .first
   }
}
