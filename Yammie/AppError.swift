//
//  AppError.swift
//  Yammie
//
//  Created by sherif on 13/09/2022.
//

import Foundation


enum AppError :LocalizedError{
    case errorDecoding
    case unknownError
    case serverError(String)
    case invalidUrl
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "Ohhh!!! i have no idea for the Error"
        case .invalidUrl:
            return "Error in Url Give Vaild URL"
        case .serverError(let error):
            return error
        }
        
    }
    
}
