//
//  WelcomeView.swift
//  UIKitApp
//
//  Created by Laura Anguiano on 15/09/22.
//

import UIKit

final class WelcomeView: UIView {
    
    weak var delegate: WelcomeViewDelegate?

    // MARK: - Header image
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "WelcomeHeader")
        return imageView
    }()

    // MARK: - Header labels
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = LocalizableKeys.Welcome.title
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: WelcomeConstants.titleTextSize)
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = LocalizableKeys.Welcome.description
        label.textAlignment = .center
        label.font = .systemFont(ofSize: WelcomeConstants.contentTextSize, weight: .light)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Action buttons
    private let registerButton: PrimaryButton = {
        let button = PrimaryButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .boldSystemFont(ofSize: WelcomeConstants.contentTextSize)
        button.setTitle(LocalizableKeys.Welcome.registerButtonTitle, for: .normal)
        return button
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .boldSystemFont(ofSize: WelcomeConstants.contentTextSize)
        button.setAttributedTitle(WelcomeConstants.signInButtonAttributedTitle, for: .normal)
        button.backgroundColor = .white
        return button
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setSubviews()
        setupConstraints()
        setupActions()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubviews() {
        addSubview(headerImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(registerButton)
        addSubview(signInButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: WelcomeConstants.margin),
            headerImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: WelcomeConstants.margin),
            headerImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -WelcomeConstants.margin),
            headerImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: WelcomeConstants.heightImageMultiplier),
            
            titleLabel.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: WelcomeConstants.margin),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: WelcomeConstants.margin),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -WelcomeConstants.margin),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: WelcomeConstants.margin),
            descriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: WelcomeConstants.margin),
            descriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -WelcomeConstants.margin),
            
            registerButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: WelcomeConstants.margin),
            registerButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -WelcomeConstants.margin),
            registerButton.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -WelcomeConstants.margin),
            registerButton.heightAnchor.constraint(equalToConstant: WelcomeConstants.registerButtonHeight),
            
            signInButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: WelcomeConstants.margin),
            signInButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -WelcomeConstants.margin),
            signInButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -WelcomeConstants.margin),
        ])
    }

    private func setupActions() {
        registerButton.addTarget(self, action: #selector(didRegisterTapped), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(didSignInTapped), for: .touchUpInside)
    }
    
    @objc private func didRegisterTapped() {
        delegate?.showSignUp()
    }

    @objc private func didSignInTapped() {
        delegate?.showSignIn()
    }
}
