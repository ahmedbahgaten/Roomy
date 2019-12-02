//
//  HomeVC.swift
//  Roomy
//
//  Created by AHMED on 10/31/19.
//  Copyright © 2019 AHMED. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let street = ["34 Pierrepont St #C7","86 Gerrymain Rd #F3","22 Yonker St #B4" , "90 Simmons Rd #M3"]
    let price = ["2,500$","1,250$","4,200$","2,700$"]
    let address = ["Brooklyn, NY 11236","NewYork NY 11253","Queens,NY 11539","Brooklyn,NY11236"]
    let FlatImages :[UIImage] = [#imageLiteral(resourceName: "a63ccac00c7d621857898eb04330f303a55cea72"),#imageLiteral(resourceName: "ba247016de035e2c7b6312457302117c316298d9"),#imageLiteral(resourceName: "5f9d2a8019b7de7e771dbe18f761af282acabb19"),#imageLiteral(resourceName: "a2c73f37021cdb119855041400d89162a5c07765"),#imageLiteral(resourceName: "92103a27b2f3f0f0f0f49f940861d74824895162"),#imageLiteral(resourceName: "92103a27b2f3f0f0f0f49f940861d74824895162"),#imageLiteral(resourceName: "24d1ad730cd767672565497842121bb04a02f7d9"),#imageLiteral(resourceName: "a63ccac00c7d621857898eb04330f303a55cea72"),#imageLiteral(resourceName: "5f9d2a8019b7de7e771dbe18f761af282acabb19"),#imageLiteral(resourceName: "a2c73f37021cdb119855041400d89162a5c07765"),#imageLiteral(resourceName: "a63ccac00c7d621857898eb04330f303a55cea72")]
    let Utilities = ["2 bed 1 bath","1 bed 1 bath","3 bed 2 bath","2 bed 1 bath"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "HomeCells", bundle: nil), forCellReuseIdentifier: "MyCell")
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

}
extension HomeVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        street.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! HomeCells
        cell.Adress0.text = street[indexPath.row]
        cell.Adress1.text = address[indexPath.row]
        cell.Price.text = price[indexPath.row]
        cell.ImageView1.image = FlatImages[indexPath.row]
        cell.Description.text = Utilities[indexPath.row]
        return cell
        
    }
   
}
