//
//  RegisterConfirmationViewController.swift
//  UIKitApp
//
//  Created by 291732 on 22/09/22.
//

import UIKit

class RegisterConfirmationViewController: UIViewController {
    //MARK: - O U T L E S
    @IBOutlet weak var vwContainer: UIView!{
        didSet{ vwContainer.layer.cornerRadius = 25 }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func btnThanks(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
