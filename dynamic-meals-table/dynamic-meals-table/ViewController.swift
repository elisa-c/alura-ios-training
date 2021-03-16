//
//  ViewController.swift
//  dynamic-meals-table
//
//  Created by Elisa Camillo on 16/03/21.
//

import UIKit

class ViewController: UITableViewController {
    
    let meals = ["cake", "beans", "rice", "noodles"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("did load")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        return cell
    }
    
    
//    func viewDidLoad(){
//      "Overriding declaration requires an 'override' keyword"
//      viewDidLoad is already declared by UIViewController, that is inherited by UITableViewController and consequently by this very class
//    }
    
    
}

