//
//  Network Layer.swift
//  Roomy
//
//  Created by AHMED on 11/17/19.
//  Copyright © 2019 AHMED. All rights reserved.
//

import Foundation
import Alamofire

class  NetworkManager {
    static func login (Email:String,Password:String,completionHandler:@escaping (Result<[String: Any], Error>) -> ()) {
        let loginRequest = AuthenticationRouter.login(Email: Email, Password:Password)
        AF.request(loginRequest).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                completionHandler(Result.success(value as! [String:Any]))
            case.failure(let error):
                completionHandler(Result.failure(error))
            }
        }
    }
}
