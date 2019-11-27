//
//  HomeController.swift
//  ShoppingAssistant
//
//  Created by Gaman Rares-Constantin on 10/31/19.
//  Copyright © 2019 Gaman Rares-Constantin. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    @IBAction func SignOut(_ sender: Any) {
        UserDefaults.standard.setIsLoggedIn(value: false)
        performSegue(withIdentifier: "SignOutSegue1", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

