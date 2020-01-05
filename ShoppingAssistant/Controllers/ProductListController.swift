//
//  ProductListController.swift
//  ShoppingAssistant
//
//  Created by Gaman Rares-Constantin on 1/5/20.
//  Copyright © 2020 Gaman Rares-Constantin. All rights reserved.
//

import UIKit

class ProductListController: UITableViewController {
    
    @IBAction func signOut(_ sender: Any) {
        UserDefaults.standard.setIsLoggedIn(value: false)
        performSegue(withIdentifier: "SignOutFromProductList", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
