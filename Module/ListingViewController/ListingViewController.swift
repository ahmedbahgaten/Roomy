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
    //MARK:-Variables
    var room: RoomData?
    //MARK:-Outlets
    @IBOutlet weak var RequestInfoBttn: UIButton!
    @IBOutlet weak var listingImageView: UIImageView!
    //MARK:-ViewDidLoad
    override open func viewDidLoad() {
        super.viewDidLoad()
        SignInViewController().roundedBttnWithShadow(Bttn: RequestInfoBttn)
        setImage(Image: room?.image ?? "")
    }
  
    //MARK:-Functions
    func setImage(Image:String) {
           listingImageView.kf.setImage(with: URL(string: Image), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
       }
    
    @IBAction func requestInfoAction(_ sender: Any) {
        let alert = UIAlertController(title: "Sorry", message: "This is currently not available ", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
}
