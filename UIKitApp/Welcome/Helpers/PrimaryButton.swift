//
//  PrimaryButton.swift
//  UIKitApp
//
//  Created by Laura Anguiano on 15/09/22.
//

import UIKit

@IBDesignable final class PrimaryButton: UIButton {

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
    
    // MARK: - Properties
    @IBInspectable
    var color: UIColor = CustomColor.primary.value {
        didSet {
            backgroundColor = color
        }
    }
}

// MARK: - Private methods
extension PrimaryButton {
    func setupViewStyle() {
        backgroundColor = color
        layer.cornerRadius = 14
        setTitleColor(CustomColor.text.value, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: WelcomeConstants.contentTextSize)
    }
}
