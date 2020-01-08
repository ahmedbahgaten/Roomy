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
}
//MARK:-
class RoomFetchingPresenter:RoomFetching {
    
    let router:HomeRouter!
    init(roomView:HomeView,router:HomeRouter) {
        self.router = router
        self.RoomView = roomView
    }
    weak var RoomView: HomeView!
    private var rooms = [RoomData]()
    
    func fetchRooms() {
        NetworkManager.roomFetching { (rooms,error) in
            guard let myrooms = rooms else {return}
            self.rooms = myrooms
            self.RoomView.reloadData()
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
    
}
