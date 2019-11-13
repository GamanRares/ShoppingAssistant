//
//  User.swift
//  ShoppingAssistant
//
//  Created by Gaman Rares-Constantin on 10/17/19.
//  Copyright © 2019 Gaman Rares-Constantin. All rights reserved.
//

import Foundation

class User: Hashable {
    
    var fullName: String
    var password: String
    var email: String
    var role: Role
    var offers: Set<Offer> = Set<Offer>()
    var products: Set<Product> = Set<Product>()
    var shoppingCart: Set<Offer> = Set<Offer>()
    
    init(fullName: String, password: String, email: String, role: Role) {
        self.fullName = fullName
        self.password = password
        self.email = email
        self.role = role
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.email == rhs.email
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(email)
    }
    
    func addOffer(offer: Offer) {
        self.offers.insert(offer)
    }
    
    func removeOffer(offer: Offer) {
        self.offers.remove(offer)
    }
    
    func addProduct(product: Product) {
        self.products.insert(product)
    }
    
    func removeProduct(product: Product) {
        self.products.remove(product)
    }
    
}
