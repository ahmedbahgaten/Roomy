//
//  SignUpViewController.swift
//  Roomy
//
//  Created by AHMED on 11/13/19.
//  Copyright © 2019 AHMED. All rights reserved.
//

import UIKit
import Alamofire
class SignUpViewController: UIViewController {

   
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var signUpBttn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let signUp = SignInVC()
        signUp.roundedBttnWithShadow(Bttn: signUpBttn)
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        guard let name = nameLabel.text else {return}
        guard let email = emailLabel.text else {return}
        guard let password = passwordLabel.text else {return}
        NetworkManager.signUp(name: name, email: email, password: password) { (response) in
            switch response {
            case.success(let value):
                print(value)
            case.failure(let Error):
                print(Error)
            }
        }
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
