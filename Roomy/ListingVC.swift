//
//  ListingVC.swift
//  Roomy
//
//  Created by AHMED on 10/31/19.
//  Copyright © 2019 AHMED. All rights reserved.
//

import UIKit

class ListingVC: UIViewController {
    @IBOutlet weak var RequestInfoBttn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundedBttn.roundedBttnWithShadow(Bttn: RequestInfoBttn)

    }
    let roundedBttn = SignInVC()
    
}
