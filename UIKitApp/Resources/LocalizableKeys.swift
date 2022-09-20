//
//  LocalizableKeys.swift
//  UIKitApp
//
//  Created by Laura Anguiano on 15/09/22.
//

import Foundation

struct LocalizableKeys {
    
    struct Welcome {
        static let title = "welcome.title".localized
        static let description = "welcome.description".localized
        static let registerButtonTitle = "welcome.register.button.title".localized
        static let signInButtonTitle = "welcome.sign.in.button.title".localized
    }
    
    struct SignUp {
        static let title = "sign.up.title".localized
        static let emailPlaceholder = "sign.up.email.placeholder".localized
        static let fullNamePlaceholder = "sign.up.full.name.placeholder".localized
        static let passwordPlaceholder = "sign.up.password.placeholder".localized
        static let registerButtonTitle = "sign.up.register.button.title".localized
        static let signInButtonTitle = "sign.up.sign.in.button.title".localized
    }
    
    struct SignIn {
        static let image = "sign.in.image".localized
        static let title = "sign.in.title".localized
        static let emailPlaceholder = "sign.in.email.placeholder".localized
        static let passwordPlaceholder = "sign.in.password.placeholder".localized
        static let signInButtonTitle = "sign.in.sign.in.button.title".localized
        static let registerQuestionButtonTitle = "sign.in.register.question.button.title".localized
        static let registerButtonTitle = "sign.in.register.button.title".localized
    }
    
}

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
