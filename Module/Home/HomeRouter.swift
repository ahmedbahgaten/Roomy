//
//  HomeRouter.swift
//  Roomy
//
//  Created by AHMED on 1/6/20.
//  Copyright © 2020 AHMED. All rights reserved.
//

import Foundation
import UIKit
protocol HomeRouter {
    func navigateToListingViewController(room:RoomData)
    func navigationToLogin()
}
class HomeRouterImplementation:HomeRouter {
    let homeViewController:HomeViewController!
    init(homeViewController:HomeViewController) {
        self.homeViewController = homeViewController
    }
    func navigateToListingViewController(room:RoomData) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let listingViewController = storyBoard.instantiateViewController(identifier: "listingViewController") as! ListingViewController
        listingViewController.room = room
        homeViewController.navigationController?.pushViewController(listingViewController, animated: true)
    }
    func navigationToLogin() {
        let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SignIn") as SignInViewController
        homeViewController.navigationController?.pushViewController(loginViewController, animated: true)
    }
}
