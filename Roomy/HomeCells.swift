//
//  HomeCells.swift
//  Roomy
//
//  Created by AHMED on 10/31/19.
//  Copyright © 2019 AHMED. All rights reserved.
//

import UIKit

class HomeCells: UITableViewCell {
    @IBOutlet weak var Adress0: UILabel!
    @IBOutlet weak var Adress1: UILabel!
    @IBOutlet weak var FlatDescribtion: UIView!
    @IBOutlet weak var ImageView1: UIImageView!
    @IBOutlet weak var ImageView2: UIImageView!
    @IBOutlet weak var ImageView3: UIImageView!
    @IBOutlet weak var Price: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
