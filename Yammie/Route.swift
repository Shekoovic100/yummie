//
//  Route.swift
//  Yammie
//
//  Created by sherif on 13/09/2022.
//

import Foundation

enum Route {
    
    static let baseUrl = "https://yammie.glitch.me/"
    
    case fetchAllCategories
    case placeOrder(String)
    case FetchDishesbyCategory(String)
    case FetchOrders
    
    var decription:String {
        switch self {
        case .fetchAllCategories:
            return "/dish-categories"
        case .placeOrder(let dishId):
            return "/orders/\(dishId)"
        case .FetchDishesbyCategory(let categoryId):
            return "/dishes/\(categoryId)"
        case .FetchOrders: return "/orders"
        }
    }
}
