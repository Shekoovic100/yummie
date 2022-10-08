//
//  DishesModel.swift
//  Yammie
//
//  Created by sherif on 12/09/2022.
//

import Foundation


struct DishCategory:Decodable{
    
    let id ,name,image :String?
    
    enum CodingKeys:String, CodingKey{
        case id
        case name = "title"
        case image
    }
}
