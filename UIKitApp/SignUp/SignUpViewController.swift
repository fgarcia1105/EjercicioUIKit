//
//  SignUpViewController.swift
//  UIKitApp
//
//  Created by Laura Anguiano on 15/09/22.
//

import UIKit

final class SignUpViewController: UIViewController {
    
    @IBOutlet weak var pwdPassword: PrimaryTextField!
    @IBOutlet weak var fullNameTextField: PrimaryTextField!
    @IBOutlet weak var emailTextField: PrimaryTextField!
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
        configureTextFields()
    }

    private func configureTextFields(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard(_:)))
        self.view.addGestureRecognizer(gesture)

        NotificationCenter.default.addObserver(self, selector: #selector(changekeyboard(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changekeyboard(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changekeyboard(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    @objc func hideKeyboard(_ sender: UITapGestureRecognizer) {
        lblEMail.resignFirstResponder()
        lblCName.resignFirstResponder()
        lblSsap.resignFirstResponder()
    }

    @objc func changekeyboard(notification: Notification){
        let keyboardInfo = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue
        let keyboarDimensions = keyboardInfo?.cgRectValue
        let keyboardHeight = keyboarDimensions?.height

        switch notification.name.rawValue {
        case "UIKeyboardWillHideNotification":
            view.frame.origin.y = 0
        case "UIKeyboardWillShowNotification":
            if lblEMail.isFirstResponder { view.frame.origin.y = (-1 * keyboardHeight!) * 0.3 }
            if lblCName.isFirstResponder { view.frame.origin.y = (-1 * keyboardHeight!) * 0.5 }
            if lblSsap.isFirstResponder { view.frame.origin.y = (-1 * keyboardHeight!) * 0.7 }
        default: view.frame.origin.y = 0
        }
    }
    
    private func setGestures(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - IBActions
    @IBAction func didTapSignUp(_ sender: Any) {
        
        if validateItems() {
            let RCheckVC = RegisterConfirmationViewController()
            RCheckVC.modalPresentationStyle = .automatic
            self.present(RCheckVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func didTapSignIn(_ sender: Any) {
        
    }
    
    func showAlert(msg: String) {
        let alert = UIAlertController(title: "My app", message: msg , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func validateItems() -> Bool{
        if emailTextField.text == "" {
            showAlert(msg: "Ingrese un correo electónico válido")
            return false
        }
        
        if fullNameTextField.text == "" {
            showAlert(msg: "Ingrese un Nombre válido")
            return false
        }
        
        if pwdPassword.text == "" {
            showAlert(msg: "Ingrese un Password válido")
            return false
        }
        
        return true
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
