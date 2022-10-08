//
//  UserDefaults+Extension.swift
//  Yammie
//
//  Created by sherif on 15/09/2022.
//

import Foundation


/*
 this extension to make sure if app is go to get started Button  once you installed
 this app on your device that is mean you Wouldnot  every time to reopen app from scratch
 the next time should open home directly
 so we made ext on user defaults  with enum
*/

extension UserDefaults{
    private enum userDefaultsKeys:String {
        case hasOnboarded
    }
    var hasOnboarded:Bool {
        
        get{
            return bool(forKey: userDefaultsKeys.hasOnboarded.rawValue)
        }
        set{
            setValue(newValue, forKey: userDefaultsKeys.hasOnboarded.rawValue)
        }
    }
    
}
