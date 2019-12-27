//
//  HomeVC.swift
//  Roomy
//
//  Created by AHMED on 10/31/19.
//  Copyright © 2019 AHMED. All rights reserved.
//

import UIKit
import Kingfisher
protocol fromHomeToListingProtocol {
    func setImage (Image:String)
}
protocol HomeView:AnyObject{
    func reloadData()
}

class HomeViewController: UIViewController,HomeView {
    var homeToListingDelegate:fromHomeToListingProtocol?
    var presenter:RoomFetching!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    //MARK:-ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = RoomFetchingPresenter()
        presenter.RoomView = self
        tableView.register(UINib(nibName: "HomeCells", bundle: nil), forCellReuseIdentifier: "MyCell")
        tableView.delegate = self
        tableView.dataSource = self
        presenter.fetchRooms()
        dismiss(animated: false, completion: nil)

    }
    func reloadData() {
        tableView.reloadData()
    }
}
//MARK:-HomeVC Extension
extension HomeViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getRoomsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! HomeCells
        let Title = presenter.getItem(atIndex: indexPath.row).title
        let Place = presenter.getItem(atIndex: indexPath.row).place
        let Price = presenter.getItem(atIndex: indexPath.row).price
        let Description = presenter.getItem(atIndex: indexPath.row).description
        guard let firstImageURL = presenter.getItem(atIndex: indexPath.row).image else {return cell}
        
        cell.configure(Address0: Title ?? "" , Address1: Place ?? "", ImageViewURL: firstImageURL , Price: Price ?? "", DescriptionText: Description ?? "")   // howa na hena m3mltsh violate l el MVP princeple 3shan 5leet el configure y7sl fl view msh el presenter?
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        homeToListingDelegate?.setImage(Image: presenter.getItem(atIndex: indexPath.row).image ?? "")
        let room = presenter.getItem(atIndex: indexPath.row)
        navigateToListingViewController(room: room)
    }
    func navigateToListingViewController (room: RoomData) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let listingViewController = storyBoard.instantiateViewController(identifier: "listingViewController") as! ListingViewController
        listingViewController.room = room
        navigationController?.pushViewController(listingViewController, animated: true)
    }
    
}
