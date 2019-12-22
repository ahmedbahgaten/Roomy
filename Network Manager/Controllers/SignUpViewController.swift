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
    override func viewDidLoad() {
        super.viewDidLoad()
        let signUp = LoginViewController()
        signUp.roundedBttnWithShadow(Bttn: signUpBttn)
        self.hideKeyboardWhenTappedAround()
        presenter = signUpPresenterImplementation()
        presenter.signUpView = self
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        guard let name = nameLabel.text else {return}
        guard let email = emailLabel.text else {return}
        guard let password = passwordLabel.text else {return}
        presenter.signUp(name: name, email: email, password: password)
    }
    
    func navigateToSignInVC() {
          let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let signInViewController = storyBoard.instantiateViewController(identifier: "SignIn")
        self.navigationController?.pushViewController(signInViewController, animated: true)
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
