//
//  LoginConfigurator.swift
//  Roomy
//
//  Created by AHMED on 1/6/20.
//  Copyright © 2020 AHMED. All rights reserved.
//

import Foundation
class LoginConfigurator {
   static func configure(loginViewController:SignInViewController) {
        let router = LoginRouterImplementation(loginViewController: loginViewController)
        let presenter = LoginPresenterImplementation(loginView: loginViewController, router: router)
        loginViewController.presenter = presenter
        
    }
}
