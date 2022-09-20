//
//  CustomColor.swift
//  UIKitApp
//
//  Created by Laura Anguiano on 15/09/22.
//

import Foundation
import UIKit

enum CustomColor {
    case primary
    case text
    case border
}

extension CustomColor {
    var value: UIColor {
        switch self {
        case .primary: return UIColor(red: 99/254, green: 131/254, blue: 255/254, alpha: 1)
        case .text: return UIColor(red: 31/254, green: 15/254, blue: 56/254, alpha: 1)
        case .border: return UIColor(red: 152/254, green: 152/254, blue: 152/254, alpha: 1)
        }
    }
}
