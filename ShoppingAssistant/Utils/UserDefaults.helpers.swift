//
//  UserDefaults.helpers.swift
//  ShoppingAssistant
//
//  Created by Gaman Rares-Constantin on 11/13/19.
//  Copyright © 2019 Gaman Rares-Constantin. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    enum UserDefaultsKeys: String {
        case isLoggedIn
    }
    
    func setIsLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        synchronize()
    }
    
    func isLoggedIn() -> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
}
