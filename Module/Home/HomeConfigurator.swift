//
//  HomeConfigurator.swift
//  Roomy
//
//  Created by AHMED on 1/6/20.
//  Copyright © 2020 AHMED. All rights reserved.
//

import Foundation
class HomeConfigurator {
    static func configure(homeViewController:HomeViewController) {
        let router = HomeRouterImplementation(homeViewController: homeViewController)
        let presenter = RoomFetchingPresenter(roomView: homeViewController, router: router)
        homeViewController.presenter = presenter
        
    }
}
