//
//  Model.swift
//  Roomy
//
//  Created by AHMED on 12/3/19.
//  Copyright © 2019 AHMED. All rights reserved.
//

import Foundation
import UIKit
struct RoomData:Codable {
    let id: Int?
    let title:String?
    let description:String?
    let place:String?
    let price:String?
    let image:String?
    let created_at: String?
    let updated_at: String?

}
