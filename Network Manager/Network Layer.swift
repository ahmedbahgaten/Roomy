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
            case .success(let value):
                completionHandler(Result.success(value as! [String:Any]))
            case .failure(let Error):
                completionHandler(Result.failure(Error))
            }
        }

    }
    func roomFetching (completionHandler: @escaping (Result<Array<Dictionary<String,Any>>,Error>) -> Void){
        guard let url = URL(string: "https://roomy-application.herokuapp.com/rooms") else {return}
        let Token = "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0MjIsImV4cCI6MTU3NjA2OTY5Mn0.ZLLzvZ_nJzjVH8T8Z9tF_hBD1FJF31mLbdZhSx_cIcA"
        let Headers:HTTPHeaders = ["Authorization":Token]
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: Headers).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                completionHandler(Result.success(value as! Array<Dictionary<String,Any>>))
                guard let responseData = response.data else {return}
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode([RoomData].self, from: responseData)
                    
                    
                } catch {
                    print("Whoops, an error occured: \(error)")
                }
            case.failure(let error):
                completionHandler(Result.failure(error))
            }
            
        }
}
}


