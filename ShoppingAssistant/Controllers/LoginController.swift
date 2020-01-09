//
//  LoginController.swift
//  ShoppingAssistant
//
//  Created by Gaman Rares-Constantin on 10/2/19.
//  Copyright © 2019 Gaman Rares-Constantin. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func Login(_ sender: Any) {
        
        guard let userName = usernameField.text, !usernameField.text!.isEmpty else {
            self.alert(tittle: "Error", message: "Username or password are incorect", buttonMessage: "Try again")
            return
        }
        
        guard let password = passwordField.text, !passwordField.text!.isEmpty else {
            self.alert(tittle: "Error", message: "Username or password are incorect", buttonMessage: "Try again")
            return
        }
        
        for user in HighPerformanceButCostlyDatabase.users {
            if user.email == userName {
                if user.password == Utils().sha256(stringToEncrypt: password) {
                    UserDefaults.standard.setIsLoggedIn(value: true)
                    performSegue(withIdentifier: "LoginSegue", sender: self)
                    return
                }
            }
        }
        
      self.alert(tittle: "Error", message: "Username or password are incorect", buttonMessage: "Try again")
        
    }
    
    @IBAction func SignUp(_ sender: Any) {
        performSegue(withIdentifier: "SignUpSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        passwordField.isSecureTextEntry = true
    
    }

    private func alert(tittle:String, message:String, buttonMessage:String) {
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonMessage, style: .default, handler: nil))
        self.present(alert, animated: true)
    }

}

