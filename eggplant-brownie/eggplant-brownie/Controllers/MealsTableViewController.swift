//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Elisa Camillo on 16/03/21.
//


import UIKit

class MealsTableViewController: UITableViewController, AddMealsDelegate {

    var meals = [Meal(name: "Noodles", happiness: 4, items: []),
                 Meal(name: "Pizza", happiness: 4, items: []),
                 Meal(name: "Temaki", happiness: 4, items: []),
                 Meal(name: "Guacamole", happiness: 4, items: [])]
    
    func add(meal: Meal) {
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "add" {
            let view = segue.destination as! ViewController
                view.delegate = self
        }
     
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currMeal = meals[indexPath.row]
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = currMeal.name
        
        return cell
    }
    

    

    
}
