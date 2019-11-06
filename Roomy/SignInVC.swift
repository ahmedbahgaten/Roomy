//
//  SignInVC.swift
//  Roomy
//
//  Created by AHMED on 10/29/19.
//  Copyright © 2019 AHMED. All rights reserved.
//

import UIKit

  class SignInVC: UIViewController {
    @IBOutlet weak var SignInBttn: UIButton!
    @IBOutlet weak var OvalView: UIView!
    
    @IBOutlet weak var OvalView2: UIView!
    
    @IBOutlet weak var OvalView3: UIView!
    @IBOutlet weak var OvalView4: UIView!
    
    
    
    override  func viewDidLoad() {
        super.viewDidLoad()
roundedBttnWithShadow(Bttn: SignInBttn)
       // circleOval(view: OvalView)
        circleOval(viewType: OvalView)
        circleOval(viewType: OvalView2)
        circleOval(viewType: OvalView3)
        circleOval(viewType: OvalView4)
        // Do any additional setup after loading the view.
    }
    
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

