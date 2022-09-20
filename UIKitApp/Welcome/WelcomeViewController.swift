//
//  WelcomeViewController.swift
//  UIKitApp
//
//  Created by Laura Anguiano on 15/09/22.
//

import UIKit
import SwiftUI

final class WelcomeViewController: UIViewController {
    
    private let welcomeView = WelcomeView()
    
    override func loadView() {
        super.loadView()
        view = welcomeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewStyle()
        welcomeView.delegate = self
    }
    
}

// MARK: - Private methods
extension WelcomeViewController {

    private func setupViewStyle() {
        welcomeView.backgroundColor = .white
    }
}

// MARK: - WelcomeViewDelegate
extension WelcomeViewController: WelcomeViewDelegate {
    func showSignIn() {
        let signInView = SignInView()
        // this is necessary to show SwiftUI views from UIKit
        let signInViewHosting = UIHostingController(rootView: signInView)
        show(signInViewHosting, sender: nil)
    }
    
    func showSignUp() {
        let signUpViewController = SignUpViewController.getViewController()
        show(signUpViewController, sender: nil)
    }
}
