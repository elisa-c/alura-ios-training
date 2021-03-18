//
//  RemoveMealViewController.swift
//  eggplant-brownie
//
//  Created by Elisa Camillo on 17/03/21.
//

import Foundation

import UIKit

class RemoveMealViewController {
    let controller: UIViewController
    
    init(controller:UIViewController) {
        self.controller = controller
    }
    
    func show(_ selectedMeal: Meal, handler: @escaping (UIAlertAction) -> Void){
        let alert = UIAlertController(title: selectedMeal.name, message: selectedMeal.details(), preferredStyle: .alert)
        
        let buttonCancel = UIAlertAction(title: "OK", style: .cancel)
        
        alert.addAction(buttonCancel)
        
        let buttonRemove = UIAlertAction(title: "Remove", style: .destructive,
            //closure
            handler: handler)
        
        alert.addAction(buttonRemove)
        
        controller.present(alert, animated: true, completion: nil)
    }
}
