//
//  RoomFetchingPresenter.swift
//  Roomy
//
//  Created by AHMED on 12/20/19.
//  Copyright © 2019 AHMED. All rights reserved.
//

import Foundation
protocol RoomFetching {
    var RoomView:HomeView! {get set}
    //MARK:- Protocol function declarations
    func fetchRooms()
    func getRoomsCount() -> Int
    func getItem(atIndex: Int) -> RoomData
    func rowIsSelected(room:RoomData)
    func navigateToLogin()
    func deleteUserDefaultsData()
}
//MARK:-
class RoomFetchingPresenter:RoomFetching {
    let router:HomeRouter!
    weak var RoomView: HomeView!
    init(roomView:HomeView,router:HomeRouter) {
        self.router = router
        self.RoomView = roomView
    }
    private var rooms = [RoomData]()
    
    func fetchRooms() {
        NetworkManager.roomFetching { [weak self] (rooms,error) in
            if error != nil {
                self?.router.navigationToLogin()
            }
            else {
                guard let myrooms = rooms else {return}
                self?.rooms = myrooms
            self?.RoomView.reloadData()
        }
        }
    }
    func getRoomsCount() -> Int {
        return rooms.count
    }
    func getItem(atIndex: Int) -> RoomData {
        return rooms[atIndex]
    }
    func rowIsSelected(room: RoomData) {
        self.router.navigateToListingViewController(room: room)
    }
    func navigateToLogin() {
        self.router.navigationToLogin()
     }
    func deleteUserDefaultsData() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
    }
    
}
