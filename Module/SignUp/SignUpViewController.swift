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
    func hideIndicator()
}
class SignUpViewController: UIViewController,signUpView{
    //MARK:-Variables
    var presenter:signUpPresenterImplementation!
    //MARK:-Outlets
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var signUpBttn: UIButton!
    @IBOutlet weak var signUpLoadingIndicator: UIActivityIndicatorView!
    //MARK:-ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        SignInViewController().roundedBttnWithShadow(Bttn: signUpBttn)
        self.hideKeyboardWhenTappedAround()
        signUpConfigurator.configure(signUpViewController: self)
        hideIndicator()
    }
    //MARK:-Actions
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
    @IBAction func alreadyHaveAccount(_ sender: Any) {
        presenter.navigateToLogin()
    }
    
    //MARK:-Functions
    func hideIndicator() {
        signUpLoadingIndicator.isHidden = true
    }
}
//MARK:-Extension
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

