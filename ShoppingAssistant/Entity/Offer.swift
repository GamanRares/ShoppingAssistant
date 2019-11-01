//
//  Offer.swift
//  ShoppingAssistant
//
//  Created by Gaman Rares-Constantin on 10/17/19.
//  Copyright © 2019 Gaman Rares-Constantin. All rights reserved.
//

import Foundation

class Offer: Hashable {
    
    var user: User?
    var product: Product?
    var price: Double?
    
    init(user:User, price:Double) {
        self.user = user
        self.price = price
    }
    
    static func == (lhs: Offer, rhs: Offer) -> Bool {
        return lhs.user == rhs.user &&
                lhs.product == rhs.product &&
                lhs.price == rhs.price
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.user)
        hasher.combine(self.product)
        hasher.combine(self.price)
    }
    
    func removeProduct(product: Product) -> Bool {
        if self.product == product {
            self.product = nil
            user?.removeOffer(offer: self)
            user?.removeProduct(product: product)
            self.user = nil
            return true
        } else {
            return false
        }
    }
    
}
