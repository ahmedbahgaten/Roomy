//
//  SignInVC.swift
//  Roomy
//
//  Created by AHMED on 10/29/19.
//  Copyright © 2019 AHMED. All rights reserved.
//

import UIKit
import Alamofire
protocol LoginView:class {
    func navigateToHomeVC ()
    func showAlert(error:Error)
}
class LoginViewController: UIViewController,LoginView{
    //MARK:-Properties
    var GeneratedToken:String = ""
        var presenter:LoginPresenterImplementation!
    //MARK:-Outlets
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var SignInBttn: UIButton!
    @IBOutlet weak var OvalView: UIView!
    @IBOutlet weak var OvalView2: UIView!
    @IBOutlet weak var OvalView3: UIView!
    @IBOutlet weak var OvalView4: UIView!
    //MARK:-Actions
    @IBAction func SignUpButtonClicked(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let SignUpViewController = storyBoard.instantiateViewController(identifier: "SignUp")
        self.navigationController?.pushViewController(SignUpViewController, animated: true)
    }
    
    @IBAction func signInbttn(_ sender: Any) {
        guard let Email = usernameTxtField.text else {return}
        guard let Password = passwordTxtField.text else {return}
        presenter.login(email: Email, password: Password)
    }
    func navigateToHomeVC() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil) // navigating to home screen
        let homeViewController = storyBoard.instantiateViewController(identifier: "homeVC")
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    func showAlert(error: Error) {
        let Alert = UIAlertController(title: "Error", message: "An unknown error has occured please try again", preferredStyle: .alert)
        let Action = UIAlertAction(title: "Cancel", style:.cancel, handler: nil)
        Alert.addAction(Action)
        self.present(Alert,animated: true,completion: nil)
        print(error.localizedDescription)
    }
    
    
    override  func viewDidLoad() {
        super.viewDidLoad()
        roundedBttnWithShadow(Bttn: SignInBttn)
        circleOval(viewType: OvalView)
        circleOval(viewType: OvalView2)
        circleOval(viewType: OvalView3)
        circleOval(viewType: OvalView4)
        self.navigationController?.isNavigationBarHidden = true
                presenter = LoginPresenterImplementation()
                presenter.LoginView = self
        
        
    }
    
    // Do any additional setup after loading the view.
    
    //MARK:-View beautifying Functions
    func roundedBttnWithShadow(Bttn: UIButton) {
        Bttn.layer.cornerRadius = Bttn.frame.size.height/2
        Bttn.layer.shadowColor = UIColor.black.cgColor
        Bttn.layer.shadowRadius = 2
        Bttn.layer.shadowOpacity = 0.5
        Bttn.layer.shadowOffset = CGSize(width: 0.0 , height: 2.0)
        
        
    }
    func circleOval(viewType: UIView) {
        viewType.backgroundColor = .white
        viewType.layer.cornerRadius = viewType.frame.size.width/2
        viewType.clipsToBounds = true
        viewType.layer.masksToBounds = false
        viewType.layer.shadowColor = UIColor.black.cgColor
        viewType.layer.shadowRadius = 1.0
        viewType.layer.shadowOpacity = 0.5
        viewType.layer.shadowOffset = CGSize(width: 0, height: 1)
        
    }
}



