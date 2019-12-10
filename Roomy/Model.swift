//
//  Model.swift
//  Roomy
//
//  Created by AHMED on 12/3/19.
//  Copyright © 2019 AHMED. All rights reserved.
//

import Foundation
import UIKit
class Data {
    var Street:String
    var Price:String
    var Address:String
    var Utilities:String
    var FlatImages:UIImage?
    init(Street:String , Price:String, Address:String, Utilities:String, FlatImages:UIImage) {
        self.Street = Street
        self.Price = Price
        self.Address = Address
        self.Utilities = Utilities
        self.FlatImages = FlatImages
    }
}

struct RoomData:Codable {
    let title:String
    let description:String
    let place:String
    let price:String
    let image:String

}
