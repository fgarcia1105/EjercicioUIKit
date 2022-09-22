//
//  SignUpViewController.swift
//  UIKitApp
//
//  Created by Laura Anguiano on 15/09/22.
//

import UIKit

final class SignUpViewController: UIViewController {
    
     @IBOutlet weak var lblEMail: UITextField!{
         didSet{
             self.lblEMail.delegate = self
         }
     }
     
     @IBOutlet weak var lblCName: UITextField!{
         didSet{
             self.lblCName.delegate = self
         }
     }

     @IBOutlet weak var lblSsap: UITextField!{
        didSet{
            self.lblSsap.delegate = self
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    // MARK: - IBActions
    @IBAction func didTapSignUp(_ sender: Any) {
        
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
    
}
