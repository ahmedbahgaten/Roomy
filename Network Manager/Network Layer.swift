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
    //MARK: -Login Function
    static func login (email:String,password:String,completionHandler:@escaping (serverResponse? , Error?) -> ()) {
        let loginRequest = AuthenticationRouter.login(email: email, password:password)
        AF.request(loginRequest).responseJSON { (response) in
            switch response.result {
            case .success:
             guard let responseData = response.data else {return}
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(serverResponse.self, from: responseData)
                    completionHandler(data,nil)
                } catch {
                    print("Whoops, an error occured: \(error)")
                }
            case.failure(let error):
                completionHandler (nil,error)
                
            }
        }
    }
    //MARK: -SignUp function
    static func signUp (name:String ,email:String,password:String , completionHandler:@escaping (serverResponse?,Error?) -> Void) {
        let signUpRequest = AuthenticationRouter.signUp(name: name, email: email, password: password)
        AF.request(signUpRequest).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let responseData = response.data else {return}
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(serverResponse.self, from: responseData)
                    completionHandler(data,nil)
                } catch {
                    print("Whoops, an error occured: \(error)")
                }
            case .failure(let Error):
                completionHandler(nil,Error)
            }
        }
    }
    //MARK: -RoomFetching function
    static func roomFetching (completionHandler: @escaping ([RoomData]?,Error?) -> Void){
        guard let url = URL(string: "https://roomy-application.herokuapp.com/rooms") else {return}
        let Token = UserDefaults.standard.value(forKey: "Token") as! String
        let Headers:HTTPHeaders = ["Authorization":Token]
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: Headers).responseJSON { (response) in
            print (response)
            switch response.result {
            case .success:
                guard let responseData = response.data else {return}
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode([RoomData].self, from: responseData)
                    completionHandler(data, nil)
                } catch {
                    print("Whoops, an error occured: \(error)")
                }
            case.failure(let error):
                completionHandler(nil,error)
            }
            
        }
    }
}


