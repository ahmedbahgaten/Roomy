//
//  LoginRouter.swift
//  Roomy
//
//  Created by AHMED on 1/5/20.
//  Copyright © 2020 AHMED. All rights reserved.
//

import Foundation
import UIKit
protocol loginRouter {
    func navigateToHome()
}
class LoginRouterImplementation :loginRouter {
 
    
    var loginViewController:SignInViewController!
    init(loginViewController:SignInViewController) {
        self.loginViewController = loginViewController
    }
    func navigateToHome() {
        let homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "homeVC")
        loginViewController.navigationController?.pushViewController(homeViewController, animated: true)
    }
}
