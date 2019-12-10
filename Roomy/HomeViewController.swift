//
//  HomeVC.swift
//  Roomy
//
//  Created by AHMED on 10/31/19.
//  Copyright © 2019 AHMED. All rights reserved.
//

import UIKit
import Kingfisher
class HomeVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
//    var Flat:[Data] = []
    var networkManagerObject = NetworkManager()
    var Flat = [ Data(Street: "34 Pierrepont St #C7", Price: "2,500$", Address: "Brooklyn, NY 11236", Utilities: "2 bed 1 bath", FlatImages: #imageLiteral(resourceName: "ba247016de035e2c7b6312457302117c316298d9")),
           Data(Street: "86 Gerrymain Rd #F3", Price: "1,250$", Address: "NewYork NY 11253", Utilities: "1 bed 1 bath", FlatImages: #imageLiteral(resourceName: "a2c73f37021cdb119855041400d89162a5c07765")),
           Data(Street: "22 Yonker St #B4", Price: "4,200$", Address: "Queens,NY 11539", Utilities: "3 bed 2 bath", FlatImages: #imageLiteral(resourceName: "342d8c3cf0223018d3f9f3905312004ed91e36f6")),
           Data(Street: "90 Simmons Rd #M3", Price: "2,700$", Address: "Brooklyn,NY11236", Utilities: "2 bed 1 bath", FlatImages: #imageLiteral(resourceName: "2020b64b1e7f8277c5d8752487a995c946f96331"))
  ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "HomeCells", bundle: nil), forCellReuseIdentifier: "MyCell")
        tableView.delegate = self
        tableView.dataSource = self
        networkManagerObject.roomFetching { (response) in
            switch response {
            case.success(let value):
                print(value)
            case.failure(let error):
                print(error)
            }
        }
    }
    }
    


extension HomeVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Flat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! HomeCells
        cell.Adress0.text = Flat[indexPath.row].Street
        cell.Adress1.text = Flat[indexPath.row].Address
        cell.Price.text = Flat[indexPath.row].Price
        cell.ImageView1.image = Flat[indexPath.row].FlatImages
        cell.Description.text = Flat[indexPath.row].Utilities
        return cell
        
    }
   
}
