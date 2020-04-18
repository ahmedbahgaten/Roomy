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
    static func login (email:String,password:String,completionHandler:@escaping (loginServerResponse? , Error?) -> ()) {
        let loginRequest = AuthenticationRouter.login(email: email, password:password)
        AF.request(loginRequest).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let responseData = response.data else {return}
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(loginServerResponse.self, from: responseData)
                    completionHandler(data,nil)
                } catch {
                    completionHandler(nil,error)
                    print("Whoops, an error occured: \(error)")
                }
            case.failure(let error):
                completionHandler (nil,error)
                
            }
        }
    }
    //MARK: -SignUp function
    static func signUp (name:String ,email:String,password:String , completionHandler:@escaping (loginServerResponse?,Error?) -> Void) {
        let signUpRequest = AuthenticationRouter.signUp(name: name, email: email, password: password)
        AF.request(signUpRequest).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let responseData = response.data else {return}
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(loginServerResponse.self, from: responseData)
                    completionHandler(data,nil)
                } catch {
                    completionHandler(nil,error)
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
            switch response.result {
            case .success:
                guard let responseData = response.data else {return}
                do {
                    let decoder = JSONDecoder()
                    let roomData = try decoder.decode([RoomData].self, from: responseData)
                    completionHandler(roomData, nil)
                } catch {
                    completionHandler(nil,error)
                    print("Whoops, an error occured: \(error)")
                }
            case.failure(let error):
                completionHandler(nil,error)
            }
            
        }
    }
}
//struct  warehouse : Codable {
//    let coolers : Int?
//    let water_bottle : Int?
//}
//class size {
// very weird runtime error is that, when I declare the function parameter 'warehouse' with the 'e' at the end of the word I get error, and when I remove the e , the error fades away , what's the heck wrong with that?
//    static func getStock (warehous:warehouse,completionHandler:@escaping (warehouse? , Error?) -> ()) {
//let url = "http://devloma.com/dev/wp-json/datacapi/driver/get_stock_today"
//let Token = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC93d3cuZGV2bG9tYS5jb21cL2RldiIsImlhdCI6MTU4NTkyMjY5NiwibmJmIjoxNTg1OTIyNjk2LCJleHAiOjE1ODY1Mjc0OTYsImRhdGEiOnsidXNlciI6eyJpZCI6IjIxIn19fQ.t2Higc5FKwOAgQRg07kKCKxqM10mAoK85FL0-StZwjc"
//        let parameters = ["coolers":warehous.coolers,"bottle":warehous.water_bottle]
//let headers:HTTPHeaders = ["Authorization": Token]
//AF.request(url, method: .get, parameters: parameters as Parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
//    switch response.result {
//    case .success:
//        guard let responseData = response.data else {return}
//        do {
//            let decoder = JSONDecoder()
//            let data = try decoder.decode(warehouse.self, from: responseData)
//           // let data = try decoder.decode(warehouse.self, from: responseData)
//            completionHandler(data,nil)
//        } catch {
//            completionHandler(nil,error)
//            print("Whoops, an error occured: \(error)")
//        }
//    case.failure(let error):
//        completionHandler (nil,error)
//
//    }
//}
//}



