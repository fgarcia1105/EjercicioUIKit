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
             self.lblMail.delegate = self
         }
     }
     
     @IBOutlet weak var lblCName: UITextField!{
         didSet{
             self.lblFName.delegate = self
         }
     }

     @IBOutlet weak var lblSsap: UITextField!{
        didSet{
            self.lblFName.delegate = self
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
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
