//
//  LoginPresenterImplementaion.swift
//  Roomy
//
//  Created by AHMED on 12/20/19.
//  Copyright © 2019 AHMED. All rights reserved.
//

import Foundation
protocol LoginPresenter {
    var LoginView:LoginView! {get set}
    func login (email:String,password:String)
}
class LoginPresenterImplementation:LoginPresenter {
    weak var LoginView: LoginView!
    func login(email: String, password: String) {
        NetworkManager.login(email: email, password: password) { response in
                      switch response {
                      case .success(let value):
                          guard let Token = value["auth_token"]  else {return}
                          UserDefaults.standard.set(Token, forKey: "Token")
                          self.LoginView.navigateToHomeVC()
                          
                      case.failure(let Error):
                        self.LoginView.showAlert(error: Error)
                      }
                      
                  }
    }
    
    

    
    
    
    
    
    
    
    
}
