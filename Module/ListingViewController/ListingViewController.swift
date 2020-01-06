//
//  ListingVC.swift
//  Roomy
//
//  Created by AHMED on 10/31/19.
//  Copyright © 2019 AHMED. All rights reserved.
//

import UIKit
import Kingfisher
open class ListingViewController: UIViewController {
    
    var room: RoomData!
    
    func setImage(Image:String) {
        listingImageView.kf.setImage(with: URL(string: Image), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
    }
    
    
    @IBOutlet weak var RequestInfoBttn: UIButton!
    @IBOutlet weak var listingImageView: UIImageView!
    let roundedBttn = SignInViewController()
    override open func viewDidLoad() {
        super.viewDidLoad()
        roundedBttn.roundedBttnWithShadow(Bttn: RequestInfoBttn)
        setImage(Image: room.image ?? "")
    }
    
    
}
