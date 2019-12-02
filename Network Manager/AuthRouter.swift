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
    case login (Email:String , Password:String)
    case signUp (Username:String, Email:String,Password:String)
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
            case .login(let Email, let Password):
                return ["email":Email , "password":Password]

            case .signUp(let Username, let Email, let Password):
                return ["username":Username,"email":Email , "password":Password]
            }
        }()
        let method: HTTPMethod = {
            switch self {
            case .login, .signUp:
                return .post


            }

        }()
        let urlRequest = try! URLRequest(url: url, method: method)
        let encoding:ParameterEncoding = JSONEncoding.default
        return try! encoding.encode(urlRequest, with: parameter)
    }

}


