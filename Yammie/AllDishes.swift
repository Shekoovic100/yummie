//
//  AllDishes.swift
//  Yammie
//
//  Created by sherif on 15/09/2022.
//

import Foundation


struct AllDishes:Decodable {
    
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
    
    
}
