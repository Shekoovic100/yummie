//
//  PopularCollectionViewCell.swift
//  Yammie
//
//  Created by sherif on 12/09/2022.
//

import UIKit
import Kingfisher
class DishPortraitCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: DishPortraitCollectionViewCell.self)
    
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLBL: UILabel!
    @IBOutlet weak var descriptionLBL: UILabel!
    
    
   
    
     func setup(dishDetails:Dish){
        titleLBL.text = dishDetails.name
        dishImageView.kf.setImage(with: dishDetails.image?.asUrl)
        caloriesLBL.text = dishDetails.formattedCalories
        descriptionLBL.text = dishDetails.description
        
    }
    
    
}
