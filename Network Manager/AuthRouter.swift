//
//  AuthRouter.swift
//  Roomy
//
//  Created by AHMED on 11/18/19.
//  Copyright © 2019 AHMED. All rights reserved.
//

import Foundation
import Alamofire

enum AuthenticationRouter :URLRequestConvertible {
    case login (email:String , password:String)
    case signUp (name:String, email:String,password:String)
    func asURLRequest() throws -> URLRequest {
        let url:URL = {
            switch self {
            case .login:
                return URL(string:"https://roomy-application.heroukapp.com/auth/login")!
            case .signUp:
                return URL(string:"https://roomy-application.heroukapp.com/signup")!
            }
        }()
        let parameter: [String:Any]? = {
            switch self {
            case .login(let email, let password):
                return ["email":email , "password":password]

            case .signUp(let name, let email, let password):
                return ["name":name,"email":email , "password":password]
            }
        }()
        let method: HTTPMethod = {
            switch self {
            case .login, .signUp:
                return .post


            }

        }()
        let urlRequest = try! URLRequest(url: url,method: method)
        let encoding:ParameterEncoding = JSONEncoding.default
        return try! encoding.encode(urlRequest, with: parameter)
    }

}


