//
//  String+Extension.swift
//  Yammie
//
//  Created by sherif on 12/09/2022.
//

import Foundation


extension String {
    
    var asUrl:URL? {
        return URL(string: self)
    }
}
