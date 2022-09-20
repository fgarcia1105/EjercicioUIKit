//
//  Constants.swift
//  UIKitApp
//
//  Created by Laura Anguiano on 15/09/22.
//

import UIKit

struct WelcomeConstants {
    static let margin = 16.0
    static let heightImageMultiplier = 0.3
    static let titleTextSize = 32.0
    static let contentTextSize = 18.0
    static let registerButtonHeight = 70.0
    
    static let signInButtonAttributedTitle: NSMutableAttributedString = {
        var fullTitle = LocalizableKeys.Welcome.signInButtonTitle
        let rengeToBold = (fullTitle as NSString).range(of: "Sign In")
        
        var attributedTitle = NSMutableAttributedString(string: fullTitle)
        
        attributedTitle.addAttribute(NSAttributedString.Key.font,
                                     value: UIFont.systemFont(ofSize: Self.contentTextSize),
                                     range: NSRange(location: 0, length: attributedTitle.length))
        
        attributedTitle.addAttribute(NSAttributedString.Key.font,
                                     value: UIFont.boldSystemFont(ofSize: Self.contentTextSize),
                                     range: rengeToBold)
        
        return attributedTitle
    }()
}
