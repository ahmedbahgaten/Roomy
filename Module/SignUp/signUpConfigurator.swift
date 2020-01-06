//
//  signUpConfigurator.swift
//  Roomy
//
//  Created by AHMED on 1/6/20.
//  Copyright © 2020 AHMED. All rights reserved.
//

import Foundation
class signUpConfigurator {
    static func configure (signUpViewController:SignUpViewController) {
        let router = signUpRouterImplementation(signUpViewController: signUpViewController)
        let presenter = signUpPresenterImplementation(signUpView: signUpViewController, router: router)
        signUpViewController.presenter = presenter
    }
}
