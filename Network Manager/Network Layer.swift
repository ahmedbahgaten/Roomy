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
    static func login (email:String,password:String,completionHandler:@escaping (Result<[String: Any], Error>) -> ()) {
        let loginRequest = AuthenticationRouter.login(email: email, password:password)
        AF.request(loginRequest).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                completionHandler(Result.success(value as! [String:Any]))
            case.failure(let error):
                completionHandler(Result.failure(error))
                
            }
        }
    }
    static func signUp (name:String ,email:String,password:String , completionHandler:@escaping ((Result<[String:Any],Error>) -> Void)) {
        let signUpRequest = AuthenticationRouter.signUp(name: name, email: email, password: password)
        AF.request(signUpRequest).responseJSON { (response) in
            switch response.result {
            case . success(let value):
                completionHandler(Result.success(value as! [String:Any]))
            case.failure(let Error):
                completionHandler(Result.failure(Error))
            }
        }
    }
}
