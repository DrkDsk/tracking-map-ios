//
//  InputTextFieldType.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 03/06/26.
//
import SwiftUI

enum InputTextFieldType {
    case text
    case email
    case phone
    
    var keyboardType: UIKeyboardType {
            switch self {
            case .text:
                return .default
            case .email:
                return .emailAddress
            case .phone:
                return .numberPad
            }
        }

        var autocapitalization: TextInputAutocapitalization {
            switch self {
            case .email:
                return .never
            default:
                return .sentences
            }
        }

        var autocorrectionDisabled: Bool {
            switch self {
            case .email:
                return true
            default:
                return false
            }
        }
}
