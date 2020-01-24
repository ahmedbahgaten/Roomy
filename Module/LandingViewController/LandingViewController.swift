//
//  ViewController.swift
//  Roomy
//
//  Created by AHMED on 10/29/19.
//  Copyright © 2019 AHMED. All rights reserved.
//

import UIKit

class landingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func StartButtonAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let signInViewController = storyBoard.instantiateViewController(identifier: "SignIn") as! SignInViewController
        navigationController?.pushViewController(signInViewController, animated: true)
    }
    

}

