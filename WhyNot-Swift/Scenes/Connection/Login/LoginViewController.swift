//
//  LoginViewController.swift
//  WhyNot-Swift
//
//  Created by Nassim Morouche on 10/06/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var loginLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        loginButton.layer.cornerRadius = 0.5 * loginButton.bounds.size.width
        loginButton.clipsToBounds = true
        
        signupButton.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        signupButton.layer.cornerRadius = 0.5 * signupButton.bounds.size.width
        signupButton.clipsToBounds = true
        setupLabels()
    }
    
    func setupLabels() {
        emailTextField.keyboardType = UIKeyboardType.emailAddress
        passwordTextField.isSecureTextEntry = true
        loginLabel.text = NSLocalizedString("LoginViewController.loginLabel.text", comment: "")
        emailLabel.text = NSLocalizedString("LoginViewController.emailLabel.text", comment: "")
        passwordLabel.text = NSLocalizedString("LoginViewController.passwordLabel.text", comment: "")
        loginButton.setTitle(NSLocalizedString("LoginViewController.loginButton.title", comment: ""), for: .normal)
        signupButton.setTitle(NSLocalizedString("LoginViewController.signupButton.title", comment: ""), for: .normal)
    }
    
    @IBAction func login(_ sender: Any) {
        self.view.endEditing(true)
        guard let emailString = emailTextField.text,
            let passwordString = passwordTextField.text else { return }
        
        let params: [String:Any] = [
            "email": emailString.lowercased(),
            "password": passwordString
        ]
        SessionService.default.login(params: params) { (result, status) in
            if(status == 200) {
                Session.default.setToken(token: result)
                let push = HomeViewController.newInstance()
                self.navigationController?.pushViewController(push, animated: true)
            } else {
                Toast.show(message: result, controller: self)
            }
        }
    }
    
    
    @IBAction func signup(_ sender: Any) {
        let push = SignupViewController.newInstance()
        self.navigationController?.pushViewController(push, animated: true)
    }
    
}
