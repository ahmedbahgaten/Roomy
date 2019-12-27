//
//  SignUpPresenter.swift
//  Roomy
//
//  Created by AHMED on 12/22/19.
//  Copyright © 2019 AHMED. All rights reserved.
//

import Foundation

protocol SignUpPresenter {
    var signUpView:signUpView? { get set }
    func signUp(name:String,email:String,password:String)
}
class signUpPresenterImplementation:SignUpPresenter {
    weak var signUpView: signUpView?
    
    func signUp(name:String,email: String, password: String) {
        NetworkManager.signUp(name: name, email: email, password: password) { (response) in
                   switch response {
                   case.success(let value):
                       print(value)
                       self.signUpView?.navigateToSignInVC()
                   case.failure(let Error):
                       print(Error)
                   }
               }
    }
    
    
}
