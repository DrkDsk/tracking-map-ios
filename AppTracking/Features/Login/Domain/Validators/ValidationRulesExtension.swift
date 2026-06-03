//
//  ValidationRulesExtension.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 03/06/26.
//

import SwiftUI

extension ValidationRules {
    
    func validate(_ value: String) -> String? {
            switch self {
            case .required:
                return value.trimmingCharacters(in: .whitespaces).isEmpty
                    ? "Este campo es obligatorio"
                    : nil

            case .email:
                return value.contains("@")
                    ? nil
                    : "Correo inválido"

            case .minLength(let length):
                return value.count < length
                    ? "Mínimo \(length) caracteres"
                    : nil

            case .maxLength(let length):
                return value.count > length
                    ? "Máximo \(length) caracteres"
                    : nil
            }
        }
    
}
