//
//  OnBoardingCollectionViewCell.swift
//  Yammie
//
//  Created by sherif on 11/09/2022.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    static let identifier  = String(describing: OnBoardingCollectionViewCell.self)
    @IBOutlet weak var onBoardingImage: UIImageView!
    @IBOutlet weak var TitleLBL: UILabel!
    @IBOutlet weak var descreptionLBL: UILabel!
    
    
    func setup(_ slide :OnBoardingSlide){
        onBoardingImage.image = slide.image
        TitleLBL.text = slide.title
        descreptionLBL.text = slide.description
        
    }
}

