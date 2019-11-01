//
//  Product.swift
//  ShoppingAssistant
//
//  Created by Gaman Rares-Constantin on 10/17/19.
//  Copyright © 2019 Gaman Rares-Constantin. All rights reserved.
//

import Foundation

class Product: Hashable {
    
    var name: String
    var description: String
    var offers: Set<Offer> = Set<Offer>()
    
    init(name:String, description:String) {
        self.name = name
        self.description = description
    }
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.name == rhs.name &&
                lhs.description == rhs.description &&
                lhs.offers == rhs.offers
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
        hasher.combine(self.description)
        hasher.combine(self.offers)
    }
    
    func addOffer(offer:Offer) {
        self.offers.insert(offer)
    }
    
    func removeOffer(offer:Offer) {
        self.offers.remove(offer)
    }
    
}
