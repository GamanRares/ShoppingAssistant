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
        
        guard self.validateFields() != false else {
            return
        }
        
        let firstName = firstNameField.text!
        let lastName = lastNameField.text!
        let email = emailField.text!
        let password = passwordField.text!
        
        let user:User = User(fullName: firstName + " " + lastName, password: Utils().sha256(stringToEncrypt: password), email: email, role: Role.REGULAR_USER)
        
        guard HighPerformanceButCostlyDatabase.users.contains(user) != true else {
            validateEmailLabel.text = "Email adress already used"
            validateEmailLabel.isHidden = false
            return
        }
        
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
        passwordField.isSecureTextEntry = true
        confirmPasswordField.isSecureTextEntry = true
    
    }
    
    private func validateFields() -> Bool {
        guard !firstNameField.text!.isEmpty else {
            validateFirstNameLabel.text = "User must have a First Name"
            validateFirstNameLabel.isHidden = false
            return false
        }
        validateFirstNameLabel.isHidden = true
        guard !lastNameField.text!.isEmpty else {
            validateLastNameLabel.text = "User must have a Last Name"
            validateLastNameLabel.isHidden = false
            return false
        }
        validateLastNameLabel.isHidden = true
        
        let regex = "^[a-zA-Z0-9]+@[^@]*$"
        
        guard !emailField.text!.isEmpty, emailField.text!.range(of: regex, options: .regularExpression) != nil else {
            validateEmailLabel.text = "Invalid email adress"
            validateEmailLabel.isHidden = false
            return false
        }
        guard !passwordField.text!.isEmpty else {
            validatePasswordLabel.text = "User must have a Password"
            validatePasswordLabel.isHidden = false
            return false
        }
        validatePasswordLabel.isHidden = true
        guard !confirmPasswordField.text!.isEmpty else {
            validateConfirmPasswordLabel.text = "User must have a First Name"
            validateConfirmPasswordLabel.isHidden = false
            return false
        }
        validateConfirmPasswordLabel.isHidden = true
        
        if passwordField.text! != confirmPasswordField.text! {
            validatePasswordLabel.text = "Passwords doesn't match"
            validateConfirmPasswordLabel.text = "Passwords doesn't match"
            validatePasswordLabel.isHidden = false
            validateConfirmPasswordLabel.isHidden = false
            return false
        }
        
        return true
    }
    
}
