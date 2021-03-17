//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Elisa Camillo on 12/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    // IBOutlets
        
    @IBOutlet var nameTextField:UITextField?
    @IBOutlet weak var happinessTextField: UITextField?
    
    // Attributes
    
    var delegate: AddMealsDelegate?
    var items: [Item] = [Item(name: "tomato sauce", calories: 23),
                         Item(name: "cheese", calories: 67),
                         Item(name: "basil", calories: 2),
                         ]
    var selectedItems: [Item] = []
    
    // UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    // UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else {return}
        
        let currIngredient = items[indexPath.row]
        
        if (cell.accessoryType == .checkmark) {
            cell.accessoryType = .none
            if let position = selectedItems.firstIndex(of: currIngredient) {
                selectedItems.remove(at: position)
            }
        } else {
            cell.accessoryType = .checkmark
            selectedItems.append(currIngredient)
        }
        
        print("---")
        
        for item in selectedItems {
            print (item.name)
        }

    }
    
    // IBAction
    
    @IBAction func add(_ sender: Any){ // _  hidden parameter

        guard let mealName = nameTextField?.text else {
            return
        }
        
        guard let mealHappiness = happinessTextField?.text, let happiness = Int(mealHappiness) else {
            return
        }
        
        let meal = Meal(name: mealName, happiness: happiness, items: selectedItems )
                            
        delegate?.add(meal: meal)
                
        navigationController?.popViewController(animated: true)
    }
    
}
