//
//  PrimaryTextField.swift
//  UIKitApp
//
//  Created by Laura Anguiano on 15/09/22.
//

import UIKit

@IBDesignable final class PrimaryTextField: UITextField {

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViewStyle()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupViewStyle()
    }
}

// MARK: - Private methods
extension PrimaryTextField {
    func setupViewStyle() {
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = CustomColor.border.value.cgColor
    }
}
