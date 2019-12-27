//
//  SignUpViewController.swift
//  Roomy
//
//  Created by AHMED on 11/13/19.
//  Copyright © 2019 AHMED. All rights reserved.
//

import UIKit
import Alamofire
protocol signUpView:class {
    func navigateToSignInVC()
}
class SignUpViewController: UIViewController,signUpView{
    var presenter:signUpPresenterImplementation!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var signUpBttn: UIButton!
    @IBOutlet weak var signUpLoadingIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let signUp = SignInViewController()
        signUp.roundedBttnWithShadow(Bttn: signUpBttn)
        self.hideKeyboardWhenTappedAround()
        presenter = signUpPresenterImplementation()
        presenter.signUpView = self
        signUpLoadingIndicator.isHidden = true
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        guard let name = nameLabel.text else {return}
        guard let email = emailLabel.text else {return}
        guard let password = passwordLabel.text else {return}
        if email.isEmpty  == false && password.isEmpty == false && name.isEmpty == false {
            signUpLoadingIndicator.isHidden = false
            signUpLoadingIndicator.startAnimating()
            presenter.signUp(name: name, email: email, password: password)
        }
        else {
            return
        }
    }
    
    func navigateToSignInVC() {
        self.navigationController?.popViewController(animated: true)
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

