//
//  DishDetails.swift
//  Yammie
//
//  Created by sherif on 12/09/2022.
//

import Foundation


struct Dish:Decodable{
    
    let id :String?
    let name :String?
    let image:String?
    let calories:Double?
    let description:String?

    var formattedCalories :String{
        return String(format: "%.2f Calories", calories ?? 0 )
    }
}
