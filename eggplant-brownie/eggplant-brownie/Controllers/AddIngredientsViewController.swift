//
//  AddIngredientsViewController.swift
//  eggplant-brownie
//
//  Created by Elisa Camillo on 17/03/21.
//

import UIKit

protocol AddIngredientsDelegate {
    func add(_ item: Item)
}

class AddIngredientsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameIngrTextField: UITextField!
    @IBOutlet weak var caloriesTextField: UITextField!
    
    // MARK: - Attributes
    
    var delegate: AddIngredientsDelegate?
    
    init(delegate: AddIngredientsDelegate) {
        super.init(nibName: "AddIngredientsViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    
    @IBAction func addIngredient(_ sender: UIButton) {
        guard let name = nameIngrTextField.text, let calories = caloriesTextField.text else {return}
        
        if let nOfCalories = Double(calories) {
            let item = Item(
                name: name,
                calories: nOfCalories
            )

        delegate?.add(item) // if it exists, continue; it not, ignore
            navigationController?.popViewController(animated: true)
        }
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
