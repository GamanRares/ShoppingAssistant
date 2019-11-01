//
//  ViewController.swift
//  ShoppingAssistant
//
//  Created by Gaman Rares-Constantin on 10/2/19.
//  Copyright © 2019 Gaman Rares-Constantin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func Login(_ sender: Any) {
        for user in HighPerformanceButCostlyDatabase.users {
            if user.email == usernameField.text! {
                let utils = Utils()
                if user.password == utils.sha256(stringToEncrypt: passwordField.text!){
                    performSegue(withIdentifier: "LoginSegue", sender: self)
                }
            }
        }
        
        let alert = UIAlertController(title: "Error", message: "Username or password are incorect", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try again", style: .default, handler: nil))
        self.present(alert, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        HighPerformanceButCostlyDatabase.users.insert(User(fullName: "test", password: "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08", email: "test@yahoo.com", role: Role.ADMINISTRATOR))
    
    }

}

