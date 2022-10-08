//
//  DishLandScapeCollectionViewCell.swift
//  Yammie
//
//  Created by sherif on 13/09/2022.
//

import UIKit

class DishLandScapeCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: DishLandScapeCollectionViewCell.self)
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var descriptionLBL: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    func setup(dishLandscape:Dish){
        titleLBL.text = dishLandscape.name
        descriptionLBL.text = dishLandscape.description
        caloriesLbl.text = dishLandscape.formattedCalories
        dishImageView.kf.setImage(with: dishLandscape.image?.asUrl)
        
        
    }
}
