//
//  SignUpViewController.swift
//  UIKitApp
//
//  Created by Laura Anguiano on 15/09/22.
//

import UIKit

final class SignUpViewController: UIViewController {
    
    @IBOutlet weak var lblEMail: UITextField!{
        didSet{ self.lblEMail.delegate = self }
    }
    
    @IBOutlet weak var lblCName: UITextField!{
        didSet{ self.lblCName.delegate = self }
    }
    
    @IBOutlet weak var lblSsap: UITextField!{
        didSet{ self.lblSsap.delegate = self }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGestures()
    }

    
    //MARK: - F U N C T I O N S
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func setGestures(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - IBActions
    @IBAction func didTapSignUp(_ sender: Any) {
        let RCheckVC = RegisterConfirmationViewController()
        RCheckVC.modalPresentationStyle = .automatic
        self.present(RCheckVC, animated: true, completion: nil)
    }
    
    @IBAction func didTapSignIn(_ sender: Any) {
        
    }
}

// MARK: - Static Methods
extension SignUpViewController {
    static func getViewController() -> SignUpViewController {
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        guard let signUpViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else {
            fatalError("ViewController must be of type SignUpViewController")
        }
        return signUpViewController
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return view.endEditing(true)
    }
}
