//
//  DishDetailViewController.swift
//  Yammie
//
//  Created by sherif on 13/09/2022.
//

import UIKit
import ProgressHUD

class DishDetailViewController: UIViewController {

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishTitleLBL: UILabel!
    @IBOutlet weak var DishCalories: UILabel!
    @IBOutlet weak var descriptionLBL: UILabel!
    @IBOutlet weak var nameFiled: UITextField!
    
    var dish :Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        populateView()
       
    }
    
    private func populateView(){
        
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        dishTitleLBL.text = dish.name
        DishCalories.text = dish.formattedCalories
        descriptionLBL.text = dish.description
    }

    @IBAction func placeOrderButtonClicked(_ sender: UIButton) {
        guard let name = nameFiled.text?.trimmingCharacters(in: .whitespaces),!name.isEmpty else{
            ProgressHUD.showError("Enter Name Please")
            return
        }
        ProgressHUD.show("placing Order...")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) { [weak self](result) in
            
            switch result{
            case.success(_):
                ProgressHUD.showSuccess("Your Order has been recieved")
            case.failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
    }
}
