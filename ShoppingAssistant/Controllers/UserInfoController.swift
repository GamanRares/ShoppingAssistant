//
//  UserInfoController.swift
//  ShoppingAssistant
//
//  Created by Gaman Rares-Constantin on 11/28/19.
//  Copyright © 2019 Gaman Rares-Constantin. All rights reserved.
//

import UIKit

class UserInfoController: UIViewController {

    @IBAction func SignOut(_ sender: Any) {
        UserDefaults.standard.setIsLoggedIn(value: false)
        performSegue(withIdentifier: "SignOutFromInfo", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
