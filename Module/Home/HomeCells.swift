//
//  HomeCells.swift
//  Roomy
//
//  Created by AHMED on 10/31/19.
//  Copyright © 2019 AHMED. All rights reserved.
//

import UIKit
import Kingfisher

class HomeCells: UITableViewCell {
    @IBOutlet weak var Adress0: UILabel!
    @IBOutlet weak var Adress1: UILabel!
    @IBOutlet weak var FlatDescribtion: UIView!
    @IBOutlet weak var ImageView1: UIImageView!
    @IBOutlet weak var ImageView2: UIImageView!
    @IBOutlet weak var ImageView3: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var Description: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure (Address0:String,Address1:String,ImageViewURL:String,Price:String,DescriptionText:String)
    {
        Adress0.text = Address0
        Adress1.text = Address1
        Description.text = DescriptionText
        price.text = Price
        ImageView1.kf.setImage(with: URL(string: ImageViewURL), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        ImageView2.kf.setImage(with: URL(string: ImageViewURL), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        ImageView3.kf.setImage(with: URL(string: ImageViewURL), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
