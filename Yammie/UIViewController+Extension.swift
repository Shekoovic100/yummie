//
//  UIViewController+Extension.swift
//  Yammie
//
//  Created by sherif on 13/09/2022.
//

import UIKit

// extension to instantiate  any view controller  in anay class
extension UIViewController {
    
     static var identifier:String{
        
        return String(describing: self)
    }
    
    static func instantiateVC()->Self{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier)as! Self
        return controller
    }
}
