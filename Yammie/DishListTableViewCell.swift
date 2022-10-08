//
//  DishListTableViewCell.swift
//  Yammie
//
//  Created by sherif on 13/09/2022.
//

import UIKit

class DishListTableViewCell: UITableViewCell {

    
    static let identifier = String(describing: DishListTableViewCell.self)
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLBL: UILabel!
    
    @IBOutlet weak var descriptionLBL: UILabel!
    
    
    func setup(dish:Dish){
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLBL.text = dish.name
        descriptionLBL.text = dish.description
        
    }
    
    func setup(order:Orders){
        dishImageView.kf.setImage(with: order.dish?.image?.asUrl)
        titleLBL.text = order.name
        descriptionLBL.text = order.dish?.description
    }
}
