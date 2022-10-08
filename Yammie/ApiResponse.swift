//
//  ApiResponse.swift
//  Yammie
//
//  Created by sherif on 13/09/2022.
//

import Foundation


struct ApiResponse<T:Decodable>:Decodable {
    let status :Int
    let message:String?
    let data:T?
    let error:String?
}
