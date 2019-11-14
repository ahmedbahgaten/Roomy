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

    @IBOutlet weak var signUpBttn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let signUp = SignInVC()
        signUp.roundedBttnWithShadow(Bttn: signUpBttn)
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        let parameters = [
            "name": "" ,
                          "email": "",
                          "password": ""
                      ]
                      let url = "https://roomy-application.herokuapp.com/signup"
            AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).responseJSON {
                response in
                switch (response.result) {
                case .success:
                    print(response)
                    break
                case .failure:
                    print(Error.self)
                }
        }
        
    }
    



}
