//
//  UIView+Extension.swift
//  Yammie
//
//  Created by sherif on 11/09/2022.
//

import UIKit

extension UIView{
    
    @IBInspectable var cornerRadious : CGFloat {
        get {return self.cornerRadious
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
