//
//  SignUpController.swift
//  ShoppingAssistant
//
//  Created by Gaman Rares-Constantin on 11/7/19.
//  Copyright © 2019 Gaman Rares-Constantin. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    @IBOutlet weak var validateFirstNameLabel: UILabel!
    @IBOutlet weak var validateLastNameLabel: UILabel!
    @IBOutlet weak var validateEmailLabel: UILabel!
    @IBOutlet weak var validatePasswordLabel: UILabel!
    @IBOutlet weak var validateConfirmPasswordLabel: UILabel!
    
    @IBAction func save(_ sender: Any) {
        guard let firstName = firstNameField.text, !firstNameField.text!.isEmpty else {
            validateFirstNameLabel.text = "User must have a First Name"
            validateFirstNameLabel.isHidden = false
            return
        }
        validateFirstNameLabel.isHidden = true
        guard let lastName = lastNameField.text, !lastNameField.text!.isEmpty else {
            validateLastNameLabel.text = "User must have a Last Name"
            validateLastNameLabel.isHidden = false
            return
        }
        validateLastNameLabel.isHidden = true
        guard let email = emailField.text, !emailField.text!.isEmpty else {
            validateEmailLabel.text = "User must have an email address"
            validateEmailLabel.isHidden = false
            return
        }
        guard let password = passwordField.text, !passwordField.text!.isEmpty else {
            validatePasswordLabel.text = "User must have a Password"
            validatePasswordLabel.isHidden = false
            return
        }
        validatePasswordLabel.isHidden = true
        guard let confirmPassword = confirmPasswordField.text, !confirmPasswordField.text!.isEmpty else {
            validateConfirmPasswordLabel.text = "User must have a First Name"
            validateConfirmPasswordLabel.isHidden = false
            return
        }
        validateConfirmPasswordLabel.isHidden = true
        
        if password != confirmPassword {
            validatePasswordLabel.text = "Passwords doesn't match"
            validateConfirmPasswordLabel.text = "Passwords doesn't match"
            validatePasswordLabel.isHidden = false
            validateConfirmPasswordLabel.isHidden = false
            return
        }
        
        let utils = Utils()
        let user:User = User(fullName: firstName + " " + lastName, password: utils.sha256(stringToEncrypt: password), email: email, role: Role.REGULAR_USER)
        
        HighPerformanceButCostlyDatabase.users.insert(user)
        
        performSegue(withIdentifier: "signUpCompletedSegue", sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        validateFirstNameLabel.isHidden = true
        validateLastNameLabel.isHidden = true
        validateEmailLabel.isHidden = true
        validatePasswordLabel.isHidden = true
        validateConfirmPasswordLabel.isHidden = true
    
    }
    
}
