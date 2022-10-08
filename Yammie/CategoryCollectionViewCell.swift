//
//  CategoryCollectionViewCell.swift
//  Yammie
//
//  Created by sherif on 12/09/2022.
//

import UIKit
import Kingfisher
class CategoryCollectionViewCell: UICollectionViewCell {

    // line below to make id entifier is same name of collection view class
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryNameLBL: UILabel!
    
    func setup(category :DishCategory){
        
        categoryNameLBL.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asUrl)
    }
}

