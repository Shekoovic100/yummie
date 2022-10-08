//
//  Cardview.swift
//  Yammie
//
//  Created by sherif on 12/09/2022.
//

import UIKit

// this class is custom view for any cell view or you want 
class Cardview:UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    // set up card view for items in collections
    private func initialSetup(){
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10 
        cornerRadious = 10
    }
    
}
