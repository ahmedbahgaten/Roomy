//
//  ServerResponse.swift
//  Roomy
//
//  Created by AHMED on 12/28/19.
//  Copyright © 2019 AHMED. All rights reserved.
//

import Foundation

struct serverResponse:Codable {
    let message:String?
    let auth_token:String?
}
