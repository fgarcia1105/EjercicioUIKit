//
//  SignInStyles.swift
//  UIKitApp
//
//  Created by Laura Anguiano on 15/09/22.
//

import Foundation
import SwiftUI

struct TitleModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 32))
            .foregroundColor(Color.black)
            .frame(maxWidth: .infinity, alignment: .leading)

    }
}

struct SignInTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .foregroundColor(Color.black)
            .font(.system(size: 18.0))
            .textFieldStyle(.roundedBorder)
            .frame(width: .infinity, height: 44.0, alignment: .center)
    }
}


struct SignInButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 18.0))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 70.0)
            .background(Color(red: 99/254, green: 131/254, blue: 255/254))
            .foregroundColor(.black)
            .cornerRadius(20)
    }
}


