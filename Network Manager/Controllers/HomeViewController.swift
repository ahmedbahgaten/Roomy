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

class HomeVC: UIViewController,HomeView {
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
    }
    func reloadData() {
        tableView.reloadData()
    }
}
    

//MARK:-HomeVC Extension
extension HomeVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getRoomsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! HomeCells
        cell.Adress0.text = presenter.getItem(atIndex: indexPath.row).title
        cell.Adress1.text = presenter.getItem(atIndex: indexPath.row).place
        cell.Price.text = presenter.getItem(atIndex: indexPath.row).price
        cell.Description.text = presenter.getItem(atIndex: indexPath.row).description

        guard let firstImageURL = presenter.getItem(atIndex: indexPath.row).image else {return cell}
        guard let secondImageURL = presenter.getItem(atIndex: indexPath.row).image else {return cell}
        guard let thirdImageURL = presenter.getItem(atIndex: indexPath.row).image else {return cell}

        cell.ImageView1.kf.setImage(with: URL(string: firstImageURL), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        cell.ImageView2.kf.setImage(with: URL(string: secondImageURL), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        cell.ImageView3.kf.setImage(with: URL(string: thirdImageURL), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let listingViewController = storyBoard.instantiateViewController(identifier: "listingViewController")
        homeToListingDelegate?.setImage(Image: presenter.getItem(atIndex: indexPath.row).image ?? "")
        navigationController?.pushViewController(listingViewController, animated: true)
    }
}
