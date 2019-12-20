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
    case login (email : String , password : String)
    case signUp (name : String , email : String , password: String)
    case roomFetching
    func asURLRequest() throws -> URLRequest {
        let url:URL = {
            switch self {
            case .login:
                return URL(string:"https://roomy-application.herokuapp.com/auth/login")!
            case .signUp:
                return URL(string:"https://roomy-application.herokuapp.com/signup")!
            case .roomFetching:
                return URL(string: "https://roomy-application.herokuapp.com/rooms")!
            }
        }()
        
        let parameter: [String:Any]? = {
            switch self {
            case .login(let email, let password):
                return ["email": email , "password": password]

            case .signUp(let name, let email, let password):
                return ["name": name , "email": email , "password": password]
            case .roomFetching:
                return nil
            }
            
        }()
        let method: HTTPMethod = {
            switch self {
            case .login , .signUp:
                return .post
            case .roomFetching:
                return .get
            }
//            let headers: HTTPHeaders = {
//                switch self {
//                case.roomFetching:
//                    let Token = "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0MjIsImV4cCI6MTU3NjIzNzAxNn0.J2ismT6VWZVrV4vTw6c4dzVTd8ygimYZ8djdkx4N18I"
//    
//                     let Headers:HTTPHeaders = ["Authorization":Token]
//                    return Headers
//                case .login(let email, let password):
//                    return nil 
//                case .signUp(let name, let email, let password):
//                    return nil
//                    
//                }
//            }()

        }()
        let urlRequest = try! URLRequest( url : url , method : method)
//
//        switch self {
//        case .roomFetching:
//            urlRequest.addValue(<#T##value: String##String#>, forHTTPHeaderField: <#T##String#>)
//        case .login:
//            break
//        }
        
        let encoding:ParameterEncoding = JSONEncoding.default
        return try! encoding.encode(urlRequest , with : parameter)
    }

}


